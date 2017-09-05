package com.fintechviet.ads.validator;

import com.fintechviet.ads.model.Creative;
import com.fintechviet.ads.service.CreativeService;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

@Component
public class CreativeVideoValidator implements Validator {
    @Autowired
    private CreativeService creativeService;

    @Override
    public boolean supports(Class<?> aClass) {
        return Creative.class.equals(aClass);
    }

    @Override
    public void validate(Object o, Errors errors) {
        Creative creative = (Creative) o;
        creative = (Creative) o;

        if (creative.getAdvertiser().getId() == null) {
            errors.rejectValue("advertiser.id", "creativeForm.advertiser.empty");
        }

        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "title", "creativeForm.title.empty");
        if (creative.getTitle().length()  > 100) {
            errors.rejectValue("title", "creativeForm.title.size");
        }

        if (creative.getAlt().length()  > 255) {
            errors.rejectValue("alt", "creativeForm.alt.size");
        }

        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "videoLink", "creativeForm.videoLink.empty");
        if (creative.getVideoLink().length()  > 255) {
            errors.rejectValue("title", "creativeForm.videoLink.size");
        }
    }
}
