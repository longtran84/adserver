package com.fintechviet.ads.validator;

import com.fintechviet.ads.model.Ad;
import com.fintechviet.ads.model.AdLocation;
import com.fintechviet.ads.service.AdService;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

@Component
public class AdLocationValidator implements Validator {
    @Override
    public boolean supports(Class<?> aClass) {
        return AdLocation.class.equals(aClass);
    }

    @Override
    public void validate(Object o, Errors errors) {
        AdLocation adLocation = (AdLocation) o;

        if (adLocation.getFlight().getId() == null) {
            errors.rejectValue("flight.id", "adLocationForm.flight.empty");
        }

        if (adLocation.getCreative().getId() == null) {
            errors.rejectValue("creative.id", "adLocationForm.creative.empty");
        }

        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "name", "adLocationForm.name.empty");
        if (adLocation.getName().length()  > 100) {
            errors.rejectValue("name", "adLocationForm.name.size");
        }

        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "lng", "adLocationForm.longitude.empty");
        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "lat", "adLocationForm.latitude.empty");

        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "adContent", "adLocationForm.adContent.empty");
        if (adLocation.getAdContent().length()  > 255) {
            errors.rejectValue("adContent", "adLocationForm.adContent.size");
        }
    }
}
