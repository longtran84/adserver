package com.fintechviet.ads.validator;

import com.fintechviet.ads.model.User;
import com.fintechviet.ads.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

@Component
public class ForgotPasswordValidator implements Validator {
    @Autowired
    private UserService userService;

    @Override
    public boolean supports(Class<?> aClass) {
        return User.class.equals(aClass);
    }

    @Override
    public void validate(Object o, Errors errors) {
        User user = (User) o;

        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "username", "userForm.username.empty");
        if (user.getUsername().length() < 8 || user.getUsername().length() > 32) {
            errors.rejectValue("username", "userForm.username.size");
        }
        if (userService.findByUsername(user.getUsername()) == null) {
            errors.rejectValue("username", "userForm.username.notExist");
        }
    }
}
