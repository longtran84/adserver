package com.fintechviet.ads.web;

import com.fintechviet.ads.model.Campaign;
import com.fintechviet.ads.model.Creative;
import com.fintechviet.ads.service.CreativeService;
import com.fintechviet.ads.validator.CampaignValidator;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class CreativeController {
    @Autowired
    private CreativeService creativeService;

    @Autowired
    private CampaignValidator campaignValidator;

    @RequestMapping(value = "/creativeImage", method = RequestMethod.GET)
    public String creativeImage(Model model) {
        model.addAttribute("creativeForm", new Creative());

        return "creativeImage";
    }

    @RequestMapping(value = "/creativeVideo", method = RequestMethod.GET)
    public String creativeVideo(Model model) {
        model.addAttribute("creativeForm", new Creative());

        return "creativeVideo";
    }

    @RequestMapping(value = "/creativeVideo", method = RequestMethod.POST)
    public String creativeVideo(@ModelAttribute("creativeForm") Creative creativeForm, BindingResult bindingResult) {
        //campaignValidator.validate(campaignForm, bindingResult);
        creativeForm.setTemplate("video");
        if (bindingResult.hasErrors()) {
            return "creativeVideo";
        }

        creativeService.save(creativeForm);

        return "redirect:/creativeVideo";
    }

    @RequestMapping(value = "/creativeImage", method = RequestMethod.POST)
    public String creativeImage(@ModelAttribute("creativeForm") Creative creativeForm, BindingResult bindingResult) {
        //campaignValidator.validate(campaignForm, bindingResult);

        if (bindingResult.hasErrors()) {
            return "creativeImage";
        }

        creativeService.save(creativeForm);

        return "redirect:/creativeImage";
    }

}
