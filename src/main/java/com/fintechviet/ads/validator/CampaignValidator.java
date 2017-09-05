package com.fintechviet.ads.validator;

import com.fintechviet.ads.model.Campaign;
import com.fintechviet.ads.service.CampaignService;
import com.fintechviet.utils.DateUtils;
import org.apache.commons.lang3.StringUtils;
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
        return Campaign.class.equals(aClass);
    }

    @Override
    public void validate(Object o, Errors errors) {
        Campaign campaign = (Campaign) o;
        campaign = (Campaign) o;

        if (campaign.getAdvertiser().getId() == null) {
            errors.rejectValue("advertiser.id", "campaignForm.advertiser.empty");
        }

        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "name", "campaignForm.name.empty");
        if (campaign.getName().length()  > 100) {
            errors.rejectValue("name", "campaignForm.name.size");
        }

        if (campaign.isIsFreCapTmp()) {
            ValidationUtils.rejectIfEmptyOrWhitespace(errors, "freCapTmp", "campaignForm.freCap.empty");
            ValidationUtils.rejectIfEmptyOrWhitespace(errors, "freCapDurationTmp", "campaignForm.freCap.empty");
            ValidationUtils.rejectIfEmptyOrWhitespace(errors, "freCapType", "campaignForm.freCap.empty");
        }

        if ((StringUtils.isNotEmpty(campaign.getFreCapTmp()) && StringUtils.isNotEmpty(campaign.getFreCapDurationTmp())) && (!StringUtils.isNumeric(campaign.getFreCapTmp()) || !StringUtils.isNumeric(campaign.getFreCapDurationTmp()))) {
            errors.rejectValue("freCapTmp", "campaignForm.freCap.invalid");
        } else {
            if (Integer.valueOf(campaign.getFreCapTmp()) == 0 || Integer.valueOf(campaign.getFreCapDurationTmp()) == 0) {
                errors.rejectValue("freCapTmp", "campaignForm.freCap.invalid");
            }
        }

        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "startDateTmp", "campaignForm.startDate.empty");

        if (DateUtils.compare(campaign.getStartDateTmp()  + " 00:00:00", campaign.getEndDateTmp() + " 23:59:59") == DateUtils.AFTER) {
            errors.rejectValue("endDateTmp", "campaignForm.endDate.before");
        }

        if (campaign.getDescription().length()  > 255) {
            errors.rejectValue("description", "campaignForm.description.size");
        }
    }
}
