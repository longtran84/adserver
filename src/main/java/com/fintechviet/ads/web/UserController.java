package com.fintechviet.ads.web;

import com.fintechviet.ads.model.User;
import com.fintechviet.ads.service.SecurityService;
import com.fintechviet.ads.service.UserService;
import com.fintechviet.ads.validator.PasswordValidator;
import com.fintechviet.ads.validator.UserValidator;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.core.io.ResourceLoader;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;

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
    private ResourceLoader resourceLoader;

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
    public String login(Model model, String error, String logout) {
        if (error != null)
            model.addAttribute("error", "Tài khoản và mật khẩu của bạn không đúng. Hoặc tài khoản chưa được kích hoạt.");

        if (logout != null)
            model.addAttribute("message", "Bạn đã đăng xuất thành công.");

        return "login";
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
            avatarLink = "/images/avatar/" + file.getOriginalFilename();
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
}
