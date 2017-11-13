package com.fintechviet.content.validator;

import com.fintechviet.content.model.NewsCategory;
import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

@Component
public class NewsCategoryValidator implements Validator {

    @Override
    public boolean supports(Class<?> aClass) {
        return NewsCategory.class.equals(aClass);
    }

    @Override
    public void validate(Object o, Errors errors) {
        NewsCategory newsCategory = (NewsCategory) o;

        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "code", "categoryForm.code.empty");
        if (newsCategory.getCode().length()  > 50) {
            errors.rejectValue("code", "categoryForm.code.size");
        }

        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "name", "categoryForm.name.empty");
        if (newsCategory.getName().length()  > 100) {
            errors.rejectValue("name", "categoryForm.name.size");
        }

        if (newsCategory.getId() == null) {
            if (StringUtils.isEmpty(newsCategory.getImageFile().getOriginalFilename())) {
                errors.rejectValue("imageFile", "categoryForm.imageFile.empty");
            }
        }
    }
}
