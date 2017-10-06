package com.fintechviet.ads.validator;

import com.fintechviet.ads.model.AppAd;
import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

@Component
public class AppAdValidator implements Validator {

    @Override
    public boolean supports(Class<?> aClass) {
        return AppAd.class.equals(aClass);
    }

    @Override
    public void validate(Object o, Errors errors) {
        AppAd appAd = (AppAd) o;

        if (appAd.getCampaign().getId() == null) {
            errors.rejectValue("campaign.id", "appAdForm.campaign.empty");
        }
        
        //For Name
        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "name", "appAdForm.name.empty");
        if (appAd.getName().length()  > 100) {
            errors.rejectValue("name", "appAdForm.name.size");
        }

        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "installLink", "appAdForm.installLink.empty");
        if (appAd.getInstallLink().length()  > 255) {
            errors.rejectValue("installLink", "appAdForm.installLink.size");
        }

        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "shortDescription", "appAdForm.shortDescription.empty");
        if (appAd.getShortDescription().length()  > 255) {
            errors.rejectValue("shortDescription", "appAdForm.shortDescription.size");
        }

        if (appAd.getId() == null) {
            if (StringUtils.isEmpty(appAd.getIconFile().getOriginalFilename())) {
                errors.rejectValue("iconFile", "appAdForm.iconFile.empty");
            }
        }
    }
}
