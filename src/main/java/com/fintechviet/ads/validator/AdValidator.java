package com.fintechviet.ads.validator;

import com.fintechviet.ads.model.Ad;
import com.fintechviet.ads.model.Campaign;
import com.fintechviet.ads.service.AdService;
import com.fintechviet.utils.DateUtils;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

@Component
public class AdValidator implements Validator {
    @Autowired
    private AdService adService;

    @Override
    public boolean supports(Class<?> aClass) {
        return Ad.class.equals(aClass);
    }

    @Override
    public void validate(Object o, Errors errors) {
        Ad ad = (Ad) o;
        ad = (Ad) o;

        if (ad.getFlight().getId() == null) {
            errors.rejectValue("flight.id", "adForm.flight.empty");
        }

        if (ad.getCreative().getId() == null) {
            errors.rejectValue("creative.id", "adForm.creative.empty");
        }

        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "name", "adForm.name.empty");
        if (ad.getName().length()  > 100) {
            errors.rejectValue("name", "adForm.name.size");
        }

        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "impressionsTmp", "adForm.impressions.empty");
        if (StringUtils.isNotEmpty(ad.getImpressionsTmp()) && !StringUtils.isNumeric(ad.getImpressionsTmp())) {
            errors.rejectValue("impressionsTmp", "adForm.impressions.invalid");
        } else {
            if (Integer.valueOf(ad.getImpressionsTmp()) == 0) {
                errors.rejectValue("impressionsTmp", "adForm.impressions.invalid");
            }
        }

        if (ad.isIsFreCapTmp()) {
            ValidationUtils.rejectIfEmptyOrWhitespace(errors, "freCapTmp", "adForm.freCap.empty");
            ValidationUtils.rejectIfEmptyOrWhitespace(errors, "freCapDurationTmp", "adForm.freCap.empty");
            ValidationUtils.rejectIfEmptyOrWhitespace(errors, "freCapType", "adForm.freCap.empty");
        }

        if ((StringUtils.isNotEmpty(ad.getFreCapTmp()) && StringUtils.isNotEmpty(ad.getFreCapDurationTmp())) && (!StringUtils.isNumeric(ad.getFreCapTmp()) || !StringUtils.isNumeric(ad.getFreCapDurationTmp()))) {
            errors.rejectValue("freCapTmp", "adForm.freCap.invalid");
        } else {
            if (Integer.valueOf(ad.getFreCapTmp()) == 0 || Integer.valueOf(ad.getFreCapDurationTmp()) == 0) {
                errors.rejectValue("freCapTmp", "adForm.freCap.invalid");
            }
        }

        if (ad.getDescription().length()  > 255) {
            errors.rejectValue("description", "adForm.description.size");
        }
    }
}
