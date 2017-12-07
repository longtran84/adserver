package com.fintechviet.loyalty.validator;

import com.fintechviet.content.model.Game;
import com.fintechviet.loyalty.model.Phonecard;
import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

@Component
public class PhonecardValidator implements Validator {

    @Override
    public boolean supports(Class<?> aClass) {
        return Phonecard.class.equals(aClass);
    }

    @Override
    public void validate(Object o, Errors errors) {
        Phonecard phonecard = (Phonecard) o;

        //For Name
        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "name", "phoneCardForm.name.empty");
        if (phonecard.getName().length()  > 100) {
            errors.rejectValue("name", "phoneCardForm.name.size");
        }

        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "price", "phoneCardForm.price.empty");

        if (phonecard.getId() == null) {
            if (StringUtils.isEmpty(phonecard.getImageFile().getOriginalFilename())) {
                errors.rejectValue("imageFile", "phoneCardForm.imageFile.empty");
            }
        }
    }
}
