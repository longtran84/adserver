package com.fintechviet.system.validator;

import com.fintechviet.system.model.SystemParameter;
import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

@Component
public class SystemParameterValidator implements Validator {

    @Override
    public boolean supports(Class<?> aClass) {
        return SystemParameter.class.equals(aClass);
    }

    @Override
    public void validate(Object o, Errors errors) {
        SystemParameter systemParameter = (SystemParameter) o;

        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "advImagePath", "systemParameterForm.advImagePath.empty");
        if (systemParameter.getAdvImagePath().length()  > 255) {
            errors.rejectValue("advImagePath", "systemParameterForm.advImagePath.size");
        }

        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "advVideoPath", "systemParameterForm.advVideoPath.empty");
        if (systemParameter.getAdvVideoPath().length()  > 255) {
            errors.rejectValue("advVideoPath", "systemParameterForm.advVideoPath.size");
        }

        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "newsImagePath", "systemParameterForm.newsImagePath.empty");
        if (systemParameter.getNewsImagePath().length()  > 255) {
            errors.rejectValue("newsImagePath", "systemParameterForm.newsImagePath.size");
        }

        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "contentImagePath", "systemParameterForm.contentImagePath.empty");
        if (systemParameter.getContentImagePath().length()  > 255) {
            errors.rejectValue("contentImagePath", "systemParameterForm.contentImagePath.size");
        }

        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "newsCategoryPath", "systemParameterForm.newsCategoryPath.empty");
        if (systemParameter.getNewsCategoryPath().length()  > 255) {
            errors.rejectValue("newsCategoryPath", "systemParameterForm.newsCategoryPath.size");
        }

        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "appIconPath", "systemParameterForm.appIconPath.empty");
        if (systemParameter.getAppIconPath().length()  > 255) {
            errors.rejectValue("appIconPath", "systemParameterForm.appIconPath.size");
        }

        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "gameImagePath", "systemParameterForm.gameImagePath.empty");
        if (systemParameter.getAdvVideoPath().length()  > 255) {
            errors.rejectValue("gameImagePath", "systemParameterForm.gameImagePath.size");
        }

        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "advImageFolder", "systemParameterForm.advImageFolder.empty");
        if (systemParameter.getAdvImageFolder().length()  > 255) {
            errors.rejectValue("advImageFolder", "systemParameterForm.advImageFolder.size");
        }

        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "advVideoFolder", "systemParameterForm.advVideoFolder.empty");
        if (systemParameter.getAdvVideoFolder().length()  > 255) {
            errors.rejectValue("advVideoFolder", "systemParameterForm.advVideoFolder.size");
        }

        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "newsImageFolder", "systemParameterForm.newsImageFolder.empty");
        if (systemParameter.getNewsImageFolder().length()  > 255) {
            errors.rejectValue("newsImageFolder", "systemParameterForm.newsImageFolder.size");
        }

        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "contentImageFolder", "systemParameterForm.contentImageFolder.empty");
        if (systemParameter.getContentImageFolder().length()  > 255) {
            errors.rejectValue("contentImageFolder", "systemParameterForm.contentImageFolder.size");
        }

        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "newsCategoryFolder", "systemParameterForm.newsCategoryFolder.empty");
        if (systemParameter.getNewsCategoryFolder().length()  > 255) {
            errors.rejectValue("newsCategoryFolder", "systemParameterForm.newsCategoryFolder.size");
        }

        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "appIconFolder", "systemParameterForm.appIconFolder.empty");
        if (systemParameter.getAdvVideoFolder().length()  > 255) {
            errors.rejectValue("appIconFolder", "systemParameterForm.appIconFolder.size");
        }

        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "gameImageFolder", "systemParameterForm.gameImageFolder.empty");
        if (systemParameter.getGameImageFolder().length()  > 255) {
            errors.rejectValue("gameImageFolder", "systemParameterForm.gameImageFolder.size");
        }
    }
}
