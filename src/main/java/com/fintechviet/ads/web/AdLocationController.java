package com.fintechviet.ads.web;

import com.fintechviet.ads.model.AdLocation;
import com.fintechviet.ads.service.AdLocationService;
import com.fintechviet.ads.validator.AdLocationValidator;
import com.fintechviet.ads.validator.AdValidator;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class AdLocationController {
    @Autowired
    private AdLocationService adLocationService;

    @Autowired
    private AdLocationValidator adLocationValidator;

    @RequestMapping(value = "/adLocation", method = RequestMethod.GET)
    public String adLocation(Model model) {
        model.addAttribute("adLocationForm", new AdLocation());
        return "adLocation";
    }

    @RequestMapping(value = "/adLocation", method = RequestMethod.POST)
    public String adLocation(@ModelAttribute("adLocationForm") AdLocation adLocationForm, BindingResult bindingResult) {
        adLocationValidator.validate(adLocationForm, bindingResult);

        if (bindingResult.hasErrors()) {
            return "adLocation";
        }

        if (adLocationForm.getId() == null) {
            adLocationForm.setStatus("NEW");
        }

        adLocationService.save(adLocationForm);

        return "redirect:/adLocation";
    }

}
