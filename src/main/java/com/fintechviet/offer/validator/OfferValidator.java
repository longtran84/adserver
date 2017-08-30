package com.fintechviet.offer.validator;

import com.fintechviet.offer.model.OffersEntity;
import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.Validator;

/**
 * Created by tungn on 8/4/2017.
 */
@Component
public class OfferValidator implements Validator {

    @Override
    public boolean supports(Class<?> aClass) {
        return OffersEntity.class.equals(aClass);
    }

    public void validate(Object o, Errors errors) {
    }
}
