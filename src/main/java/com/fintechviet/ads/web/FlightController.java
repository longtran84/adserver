package com.fintechviet.ads.web;

import com.fintechviet.ads.model.Flight;
import com.fintechviet.ads.service.FlightService;
import com.fintechviet.ads.validator.FlightValidator;
import com.fintechviet.utils.DateUtils;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class FlightController {
    @Autowired
    private FlightService flightService;

    @Autowired
    private FlightValidator flightValidator;

    @RequestMapping(value = "/flight", method = RequestMethod.GET)
    public String flight(Model model) {
        model.addAttribute("flightForm", new Flight());

        return "flight";
    }

    @RequestMapping(value = "/flight", method = RequestMethod.POST)
    public String flight(@ModelAttribute("flightForm") Flight flightForm, BindingResult bindingResult) {
		flightValidator.validate(flightForm, bindingResult);

		if (bindingResult.hasErrors()) {
			return "flight";
		}

		flightForm.setStartDate(DateUtils.convertStringToDate(flightForm.getStartDateTmp() + " 00:00:00"));
		if (!StringUtils.isEmpty(flightForm.getEndDateTmp())) {
			flightForm.setEndDate(DateUtils.convertStringToDate(flightForm.getEndDateTmp() + " 23:59:59"));
		}
		
		if (flightForm.getId() == null) {
			flightForm.setStatus("NEW");
		}

//        flightForm.setFreCap(Integer.valueOf(flightForm.getFreCapTmp()));
//        flightForm.setFreCapDuration(Integer.valueOf(flightForm.getFreCapDurationTmp()));
        flightService.save(flightForm);

        return "redirect:/flight";
    }

}
