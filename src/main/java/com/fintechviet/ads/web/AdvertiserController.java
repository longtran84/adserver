package com.fintechviet.ads.web;

import com.fintechviet.ads.model.Advertiser;
import com.fintechviet.ads.service.AdvertiserService;
import com.fintechviet.ads.validator.AdvertiserValidator;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class AdvertiserController {
    @Autowired
    private AdvertiserService advertiserService;

    @Autowired
    private AdvertiserValidator advertiserValidator;

    @RequestMapping(value = {"/", "/advertiser"}, method = RequestMethod.GET)
    public String advertiser(Model model) {
        model.addAttribute("advertiserForm", new Advertiser());

        return "advertiser";
    }

    @RequestMapping(value = "/advertiser", method = RequestMethod.POST)
    public String advertiser(@ModelAttribute("advertiserForm") Advertiser advertiserForm, BindingResult bindingResult, Model model) {
        advertiserValidator.validate(advertiserForm, bindingResult);

        if (bindingResult.hasErrors()) {
            return "advertiser";
        }

        advertiserService.save(advertiserForm);

        return "redirect:/advertiser";
    }

}
