package com.fintechviet.ads.validator;

import com.fintechviet.ads.model.Advertiser;
import com.fintechviet.ads.service.AdvertiserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

@Component
public class AdvertiserValidator implements Validator {
    @Autowired
    private AdvertiserService advertiserService;

    @Override
    public boolean supports(Class<?> aClass) {
        return Advertiser.class.equals(aClass);
    }

    @Override
    public void validate(Object o, Errors errors) {
        Advertiser advertiser = (Advertiser) o;

        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "email", "advertiserForm.email.empty");
        if (advertiser.getEmail().length()  > 255) {
            errors.rejectValue("email", "advertiserForm.email.size");
        }
        if ((advertiserService.findByEmail(advertiser.getEmail()) != null) && (advertiser.getId() == null)) {
            errors.rejectValue("email", "advertiserForm.email.duplicate");
        }

        /*ValidationUtils.rejectIfEmptyOrWhitespace(errors, "password", "advertiserForm.password.empty");
        if (advertiser.getPassword().length() < 8 || advertiser.getPassword().length() > 32) {
            errors.rejectValue("password", "advertiserForm.password.size");
        }

        if (!advertiser.getPasswordConfirm().equals(advertiser.getPassword())) {
            errors.rejectValue("passwordConfirm", "advertiserForm.passwordConfirm.diff");
        }

        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "fullName", "advertiserForm.fullName.empty");
        if (advertiser.getFullName().length() > 100) {
            errors.rejectValue("passwordConfirm", "advertiserForm.fullName.size");
        }*/

        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "companyName", "advertiserForm.companyName.empty");
        if (advertiser.getCompanyName().length() > 255) {
            errors.rejectValue("companyName", "advertiserForm.companyName.size");
        }

        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "phone", "advertiserForm.phone.empty");
        if (advertiser.getPhone().length() > 11) {
            errors.rejectValue("phone", "advertiserForm.phone.size");
        }
    }
}
