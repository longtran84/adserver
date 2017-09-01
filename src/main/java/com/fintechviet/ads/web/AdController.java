package com.fintechviet.ads.web;

import com.fintechviet.ads.model.Ad;
import com.fintechviet.ads.service.AdService;
import com.fintechviet.ads.validator.CampaignValidator;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class AdController {
    @Autowired
    private AdService adService;

    @Autowired
    private CampaignValidator campaignValidator;

    @RequestMapping(value = "/ad", method = RequestMethod.GET)
    public String campaign(Model model) {
        model.addAttribute("adForm", new Ad());

        return "ad";
    }

    @RequestMapping(value = "/ad", method = RequestMethod.POST)
    public String campaign(@ModelAttribute("adForm") Ad adForm, BindingResult bindingResult) {
        //campaignValidator.validate(campaignForm, bindingResult);

        if (bindingResult.hasErrors()) {
            return "ad";
        }

        adService.save(adForm);

        return "redirect:/ad";
    }

}
