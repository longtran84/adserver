package com.fintechviet.ads.web;

import com.fintechviet.ads.model.Flight;
import com.fintechviet.ads.service.FlightService;
import com.fintechviet.ads.validator.CampaignValidator;
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
    private CampaignValidator campaignValidator;

    @RequestMapping(value = "/flight", method = RequestMethod.GET)
    public String flight(Model model) {
        model.addAttribute("flightForm", new Flight());

        return "flight";
    }

    @RequestMapping(value = "/flight", method = RequestMethod.POST)
    public String flight(@ModelAttribute("flightForm") Flight flightForm, BindingResult bindingResult) {
        //campaignValidator.validate(campaignForm, bindingResult);

        if (bindingResult.hasErrors()) {
            return "flight";
        }

        flightService.save(flightForm);

        return "redirect:/flight";
    }

}
