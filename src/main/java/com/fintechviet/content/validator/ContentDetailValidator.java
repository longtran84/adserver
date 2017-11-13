package com.fintechviet.content.validator;

import com.fintechviet.ads.model.Creative;
import com.fintechviet.ads.service.CreativeService;
import com.fintechviet.content.model.ContentDetails;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

@Component
public class ContentDetailValidator implements Validator {

    @Override
    public boolean supports(Class<?> aClass) {
        return ContentDetails.class.equals(aClass);
    }

    @Override
    public void validate(Object o, Errors errors) {
        ContentDetails contentDetails = (ContentDetails) o;

        if (StringUtils.isEmpty(contentDetails.getImageFile().getOriginalFilename())) {
            errors.rejectValue("imageFile", "contentDetailForm.imageFile.empty");
        }
    }
}
