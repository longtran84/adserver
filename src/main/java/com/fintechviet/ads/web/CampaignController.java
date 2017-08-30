package com.fintechviet.ads.web;

import com.fintechviet.ads.model.Campaign;
import com.fintechviet.ads.service.CampaignService;
import com.fintechviet.ads.validator.CampaignValidator;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class CampaignController {
    @Autowired
    private CampaignService campaignService;

    @Autowired
    private CampaignValidator campaignValidator;

    @RequestMapping(value = "/campaign", method = RequestMethod.GET)
    public String campaign(Model model) {
        model.addAttribute("campaignForm", new Campaign());

        return "campaign";
    }

    @RequestMapping(value = "/campaign", method = RequestMethod.POST)
    public String campaign(@ModelAttribute("campaignForm") Campaign campaignForm, BindingResult bindingResult, Model model) {
        campaignValidator.validate(campaignForm, bindingResult);

        if (bindingResult.hasErrors()) {
            return "campaign";
        }

        campaignService.save(campaignForm);

        return "redirect:/campaign";
    }

}
