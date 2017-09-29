package com.fintechviet.content.validator;

import com.fintechviet.content.model.Content;
import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

@Component
public class ContentValidator implements Validator {

    @Override
    public boolean supports(Class<?> aClass) {
        return Content.class.equals(aClass);
    }

    @Override
    public void validate(Object o, Errors errors) {
        Content content = (Content) o;
        content = (Content) o;

        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "title", "contentForm.title.empty");
        if (content.getTitle().length()  > 255) {
            errors.rejectValue("code", "contentForm.title.size");
        }
    }
}
