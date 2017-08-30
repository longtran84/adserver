package com.fintechviet.ads.validator;

import com.fintechviet.ads.model.Advertiser;
import com.fintechviet.ads.model.Campaign;
import com.fintechviet.ads.service.CampaignService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

@Component
public class CampaignValidator implements Validator {
    @Autowired
    private CampaignService campaignService;

    @Override
    public boolean supports(Class<?> aClass) {
        return Advertiser.class.equals(aClass);
    }

    @Override
    public void validate(Object o, Errors errors) {
        Campaign campaign = (Campaign) o;
        campaign = (Campaign) o;
        /*ValidationUtils.rejectIfEmptyOrWhitespace(errors, "email", "advertiserForm.email.empty");
        if (advertiser.getEmail().length()  > 255) {
            errors.rejectValue("email", "advertiserForm.email.size");
        }
        if ((advertiserService.findByEmail(advertiser.getEmail()) != null) && (advertiser.getId() == null)) {
            errors.rejectValue("email", "advertiserForm.email.duplicate");
        }

        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "companyName", "advertiserForm.companyName.empty");
        if (advertiser.getCompanyName().length() > 255) {
            errors.rejectValue("companyName", "advertiserForm.companyName.size");
        }

        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "phone", "advertiserForm.phone.empty");
        if (advertiser.getPhone().length() > 11) {
            errors.rejectValue("phone", "advertiserForm.phone.size");
        }*/
    }
}
