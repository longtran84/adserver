package com.fintechviet;

import com.fintechviet.ads.model.User;
import com.fintechviet.ads.repository.UserRepository;;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.security.core.Authentication;
import org.springframework.security.web.authentication.SavedRequestAwareAuthenticationSuccessHandler;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

/**
 * Created by tungn on 10/24/2017.
 */
public class CustomAuthenticationSuccessHandler extends SavedRequestAwareAuthenticationSuccessHandler {
    @Autowired
    private UserRepository userRepository;

    @Value("${avatar.default}")
    private String defaultAvatar;

    public CustomAuthenticationSuccessHandler(String defaultTargetUrl) {
        setDefaultTargetUrl(defaultTargetUrl);
    }

    @Override
    public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response, Authentication authentication) throws ServletException, IOException {
        HttpSession session = request.getSession();
        if (session != null) {
            User user = userRepository.findByUsername(authentication.getName());
            String avatar = StringUtils.isNotEmpty(user.getAvatarLink()) ? user.getAvatarLink() : defaultAvatar;
            session.setAttribute("userAvatar", avatar);
            String redirectUrl = (String) session.getAttribute("url_prior_login");
            if (redirectUrl != null) {
                // we do not forget to clean this attribute from session
                session.removeAttribute("url_prior_login");
                // then we redirect
                getRedirectStrategy().sendRedirect(request, response, redirectUrl);
            } else {
                super.onAuthenticationSuccess(request, response, authentication);
            }
        } else {
            super.onAuthenticationSuccess(request, response, authentication);
        }
    }
}
