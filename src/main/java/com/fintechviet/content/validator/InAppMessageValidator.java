package com.fintechviet.content.validator;

import com.fintechviet.content.model.InAppMessage;
import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

@Component
public class InAppMessageValidator implements Validator {

    @Override
    public boolean supports(Class<?> aClass) {
        return InAppMessage.class.equals(aClass);
    }

    @Override
    public void validate(Object o, Errors errors) {
        InAppMessage inAppMessage = (InAppMessage) o;

        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "subject", "inAppMessageForm.subject.empty");
        if (inAppMessage.getSubject().length()  > 255) {
            errors.rejectValue("subject", "inAppMessageForm.subject.size");
        }

        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "body", "inAppMessageForm.body.empty");
    }
}
