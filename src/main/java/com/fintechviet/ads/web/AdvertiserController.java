package com.fintechviet.ads.web;

import com.fintechviet.ads.model.Advertiser;
import com.fintechviet.ads.service.AdvertiserService;
import com.fintechviet.ads.service.SecurityService;
import com.fintechviet.ads.validator.AdvertiserValidator;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
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

    @Autowired
    private SecurityService securityService;

    @RequestMapping(value = {"/advertiser"}, method = RequestMethod.GET)
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

    @RequestMapping(value = {"/advertiserRegistration"}, method = RequestMethod.GET)
    public String advertiserRegistration(Model model) {
        model.addAttribute("advertiserForm", new Advertiser());

        return "advertiserRegistration";
    }

    @RequestMapping(value = "/advertiserRegistration", method = RequestMethod.POST)
    public String advertiserRegistration(@ModelAttribute("advertiserForm") Advertiser advertiserForm, BindingResult bindingResult) {
        advertiserValidator.validate(advertiserForm, bindingResult);

        if (bindingResult.hasErrors()) {
            return "advertiserRegistration";
        }

        advertiserService.save(advertiserForm);

        //securityService.autologin(advertiserForm.getEmail(), advertiserForm.getPasswordConfirm());

        return "redirect:/campaign";
    }

    @RequestMapping(value = {"/advertiser_profile"}, method = RequestMethod.GET)
    public String advertiserProfile(Model model) {
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        Advertiser advertiser = advertiserService.findByEmail(auth.getName());
        model.addAttribute("advertiser", advertiser);

        return "advertiser_profile";
    }

    @RequestMapping(value = {"/advertiser_profile_edit"}, method = RequestMethod.GET)
    public String advertiserProfileEdit(Model model) {
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        Advertiser advertiser = advertiserService.findByEmail(auth.getName());
        model.addAttribute("advertiserForm", advertiser);

        return "advertiser_profile_edit";
    }

    @RequestMapping(value = "/advertiser_profile_edit", method = RequestMethod.POST)
    public String advertiserProfileEdit(@ModelAttribute("advertiserForm") Advertiser advertiserForm, BindingResult bindingResult) {
        advertiserValidator.validate(advertiserForm, bindingResult);

        if (bindingResult.hasErrors()) {
            return "advertiser_profile_edit";
        }

        advertiserService.update(advertiserForm);

        return "redirect:/advertiser_profile";
    }

}
