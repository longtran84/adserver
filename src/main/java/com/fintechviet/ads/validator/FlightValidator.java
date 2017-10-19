package com.fintechviet.ads.validator;

import com.fintechviet.ads.model.Campaign;
import com.fintechviet.ads.model.Flight;
import com.fintechviet.ads.service.CampaignService;
import com.fintechviet.ads.service.FlightService;
import com.fintechviet.utils.DateUtils;
import org.apache.commons.lang3.StringUtils;
import org.apache.commons.lang3.math.NumberUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

@Component
public class FlightValidator implements Validator {
    @Autowired
    private CampaignService campaignService;

    @Override
    public boolean supports(Class<?> aClass) {
        return Flight.class.equals(aClass);
    }

    @Override
    public void validate(Object o, Errors errors) {
        Flight flight = (Flight) o;

        if (flight.getCampaign().getId() == null) {
            errors.rejectValue("campaign.id", "flightForm.campaign.empty");
        }
        
        //For Name
        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "name", "flightForm.name.empty");
        if (flight.getName().length()  > 100) {
            errors.rejectValue("name", "flightForm.name.size");
        }

//        if (flight.isIsFreCapTmp()) {
//            ValidationUtils.rejectIfEmptyOrWhitespace(errors, "freCapTmp", "flightForm.freCap.empty");
//            ValidationUtils.rejectIfEmptyOrWhitespace(errors, "freCapDurationTmp", "flightForm.freCap.empty");
//            ValidationUtils.rejectIfEmptyOrWhitespace(errors, "freCapType", "flightForm.freCap.empty");
//        }
//
//        if ((StringUtils.isNotEmpty(flight.getFreCapTmp()) && StringUtils.isNotEmpty(flight.getFreCapDurationTmp())) && (!StringUtils.isNumeric(flight.getFreCapTmp()) || !StringUtils.isNumeric(flight.getFreCapDurationTmp()))) {
//            errors.rejectValue("freCapTmp", "flightForm.freCap.invalid");
//        }

        // For Date
        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "startDateTmp", "flightForm.startDate.empty");
        if (DateUtils.compare(flight.getStartDateTmp()  + " 00:00:00", flight.getEndDateTmp() + " 23:59:59") == DateUtils.AFTER) {
            errors.rejectValue("endDateTmp", "flightForm.endDate.before");
        }

        if (flight.getCampaign().getId() != null) {
            Campaign campaign = campaignService.getById(flight.getCampaign().getId());
            String campaignStartDate = DateUtils.convertDateToString(campaign.getStartDate());
            if (DateUtils.compare(flight.getStartDateTmp()  + " 00:00:00",  campaignStartDate + " 00:00:00") == DateUtils.BEFORE) {
                errors.rejectValue("startDateTmp", "flightForm.startDate.before");
            }

            if (campaign.getEndDate() != null) {
                String campaignEndDate = DateUtils.convertDateToString(campaign.getEndDate());
                if (DateUtils.compare(flight.getEndDateTmp()  + " 23:59:59",  campaignEndDate + " 23:59:59") == DateUtils.AFTER) {
                    errors.rejectValue("endDateTmp", "flightForm.endDate.after");
                }
            }
        }

        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "price", "flightForm.price.empty");
        
        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "rateType", "flightForm.price.empty");

        if (flight.getDescription().length()  > 255) {
            errors.rejectValue("description", "flightForm.description.size");
        }
        if (flight.getPrice() != null && !NumberUtils.isCreatable(flight.getPrice().toString())) {
        	errors.rejectValue("price", "flightForm.price.invalid");
        }
    }
}
