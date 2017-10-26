package com.fintechviet.ads.web;

import com.fintechviet.ads.model.User;
import com.fintechviet.ads.service.SecurityService;
import com.fintechviet.ads.service.UserService;
import com.fintechviet.ads.validator.ForgotPasswordValidator;
import com.fintechviet.ads.validator.NewPasswordValidator;
import com.fintechviet.ads.validator.PasswordValidator;
import com.fintechviet.ads.validator.UserValidator;
import com.google.gson.Gson;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.MessageSource;
import org.springframework.core.io.ResourceLoader;
import org.springframework.http.ResponseEntity;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.mail.MessagingException;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.Locale;
import java.util.UUID;

@Controller
public class UserController {
	@Value("${devmode}")
	private boolean devMode;
	
    @Autowired
    private UserService userService;

    @Autowired
    private SecurityService securityService;

    @Autowired
    private UserValidator userValidator;

    @Autowired
    private PasswordValidator passwordValidator;

    @Autowired
    private ForgotPasswordValidator forgotPasswordValidator;

    @Autowired
    private NewPasswordValidator newPasswordValidator;

    @Autowired
    private ResourceLoader resourceLoader;

    @Autowired
    private JavaMailSender mailSender;

    @Value("${support.email}")
    private String supportEmail;

    @Value("${message.resetPassword}")
    private String resetPasswordMessage;

    private static final Gson gson = new Gson();

    @RequestMapping(value = "/registration", method = RequestMethod.GET)
    public String registration(Model model) {
        model.addAttribute("userForm", new User());

        return "registration";
    }

    @RequestMapping(value = "/registration", method = RequestMethod.POST)
    public String registration(@ModelAttribute("userForm") User userForm, BindingResult bindingResult) {
        userValidator.validate(userForm, bindingResult);

        if (bindingResult.hasErrors()) {
            return "registration";
        }

        userService.save(userForm);

        securityService.autologin(userForm.getUsername(), userForm.getPasswordConfirm());

        return "redirect:/";
    }

    @RequestMapping(value = "/login", method = RequestMethod.GET)
    public String login(HttpServletRequest request, Model model, String error, String logout) {
        String referrer = request.getHeader("Referer");
        request.getSession().setAttribute("url_prior_login", referrer);
        if (error != null)
            model.addAttribute("error", "Tài khoản và mật khẩu của bạn không đúng. Hoặc tài khoản chưa được kích hoạt.");

        if (logout != null)
            model.addAttribute("message", "Bạn đã đăng xuất thành công.");

        return "login";
    }

    @RequestMapping(value = "/forgotPassword", method = RequestMethod.GET)
    public String forgotPassword(Model model) {
        model.addAttribute("userForm", new User());

        return "forgotPassword";
    }

    @RequestMapping(value = "/forgotPassword", method = RequestMethod.POST)
    public String forgotPassword(@ModelAttribute("userForm") User userForm, BindingResult bindingResult, final HttpServletRequest request) {
        forgotPasswordValidator.validate(userForm, bindingResult);
        if (bindingResult.hasErrors()) {
            return "forgotPassword";
        }
        User user = userService.findByUsername(userForm.getUsername());
        final String token = UUID.randomUUID()
                .toString();
        userService.createPasswordResetTokenForUser(user, token);
        mailSender.send(constructResetTokenEmail(getAppUrl(request), resetPasswordMessage, token, user));
        return "sendResetPassword";
    }

    @RequestMapping(value = "/resetPassword", method = RequestMethod.GET)
    public String resetPassword(@RequestParam("id") long id, @RequestParam("token") String token) {
        boolean isValid = userService.isValidatePasswordResetToken(id, token);
        if (!isValid) {
            return "invalidResetPasswordToken";
        }
        return "redirect:/newPassword";
    }

    @RequestMapping(value = "/newPassword", method = RequestMethod.GET)
    public String newPassword(Model model) {
        model.addAttribute("userForm", new User());

        return "newPassword";
    }

    @RequestMapping(value = "/newPassword", method = RequestMethod.POST)
    public String newPassword(@ModelAttribute("userForm") User userForm, BindingResult bindingResult) {
        newPasswordValidator.validate(userForm, bindingResult);
        if (bindingResult.hasErrors()) {
            return "newPassword";
        }
        User user =
                (User) SecurityContextHolder.getContext()
                        .getAuthentication().getPrincipal();

        userService.updatePassword(user, userForm.getPassword());
        return "newPasswordSuccess";
    }

    private MimeMessage constructResetTokenEmail(final String contextPath, final String message, final String token, final User user) {
        final String url = contextPath + "/resetPassword?id=" + user.getId() + "&token=" + token;
        return constructEmail("Reset Password", message + " \r\n" + url, user);
    }

    private MimeMessage constructEmail(String subject, String body, User user) {
        MimeMessage email = mailSender.createMimeMessage();
        try {
            email.addRecipient(MimeMessage.RecipientType.TO, new InternetAddress(user.getUsername()));
            email.addFrom(new InternetAddress[] { new InternetAddress(supportEmail) });
            email.setSubject(subject, "UTF-8");
            email.setText(body, "UTF-8");
            System.setProperty("mail.mime.charset", "utf8");
        } catch (final MessagingException ex) {
            ex.printStackTrace();
        }

        return email;
    }

    private String getAppUrl(HttpServletRequest request) {
        return "http://" + request.getServerName() + ":" + request.getServerPort() + request.getContextPath();
    }

    @RequestMapping(value = "/userList", method = RequestMethod.GET)
    public String userList() {
        return "userList";
    }

    @RequestMapping(value = "/admin_profile", method = RequestMethod.GET)
    public String adminProfile(Model model) {
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        User user = userService.findByUsername(auth.getName());
        model.addAttribute("username", user.getUsername());
        return "admin_profile";
    }

    @RequestMapping(value = "/changePassword", method = RequestMethod.GET)
    public String changePassword(Model model) {
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        User user = userService.findByUsername(auth.getName());
        model.addAttribute("userForm", user);
        return "changePassword";
    }

    @RequestMapping(value = "/changePassword", method = RequestMethod.POST)
    public String changePassword(@ModelAttribute("userForm") User userForm, BindingResult bindingResult) {
        passwordValidator.validate(userForm, bindingResult);

        if (bindingResult.hasErrors()) {
            return "changePassword";
        }

        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        User user = userService.findByUsername(auth.getName());
        userService.updatePassword(user, userForm.getPassword());

        String redirectUrl = "redirect:/admin_profile";
        boolean hasAdminRole = auth.getAuthorities().stream()
                .anyMatch(r -> r.getAuthority().equals("ROLE_ADMIN"));

        if (hasAdminRole) {
            return redirectUrl;
        }
        return "redirect:/advertiser_profile";
    }

    @RequestMapping(value = "/changeAvatar", method = RequestMethod.GET)
    public String changeAvatar(Model model) {
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        User user = userService.findByUsername(auth.getName());
        model.addAttribute("userForm", user);
        model.addAttribute("avatarLink", user.getAvatarLink());
        return "changeAvatar";
    }

    @RequestMapping(value = "/changeAvatar", method = RequestMethod.POST)
    public String changeAvatar(@ModelAttribute("userForm") User userForm, BindingResult bindingResult, HttpServletRequest request) throws IOException {
        String avatarLink = "";
        MultipartFile file = userForm.getAvatarFile();
        if (!file.getOriginalFilename().isEmpty()) {
            File folderStore = resourceLoader.getResource("images/avatar").getFile();
            BufferedOutputStream outputStream = new BufferedOutputStream(
                    new FileOutputStream(
                            new File(folderStore.getAbsolutePath(), file.getOriginalFilename())));
            outputStream.write(file.getBytes());
            outputStream.flush();
            outputStream.close();
            avatarLink = "mobileads/images/avatar/" + file.getOriginalFilename();
        }
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        User user = userService.findByUsername(auth.getName());
        userService.updateAvatar(user, avatarLink);
        HttpSession session = request.getSession();
        session.setAttribute("userAvatar", user.getAvatarLink());
        String redirectUrl = "redirect:/admin_profile";
        boolean hasAdminRole = auth.getAuthorities().stream()
                .anyMatch(r -> r.getAuthority().equals("ROLE_ADMIN"));

        if (hasAdminRole) {
            return redirectUrl;
        }
        return "redirect:/advertiser_profile";
    }

    @RequestMapping(value = "/system/admin", method = RequestMethod.GET)
    public String admin(Model model) {
        return "admin";
    }

    @RequestMapping(value = "/accessDenied", method = RequestMethod.GET)
    public String accessDenied() {
        return "accessDenied";
    }

    @RequestMapping(value = "/pageNotFound", method = RequestMethod.GET)
    public String pageNotFound() {
        return "pageNotFound";
    }

    @RequestMapping(value = "/errorPage", method = RequestMethod.GET)
    public String errorPage() {
        return "errorPage";
    }
}
