package com.fintechviet.offer.web;

import com.fintechviet.offer.model.OffersEntity;
import com.fintechviet.offer.service.OfferService;
import com.fintechviet.offer.validator.OfferValidator;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * Created by tungn on 8/4/2017.
 */
@Controller
public class OfferController {
    @Autowired
    private OfferService offerService;

    @Autowired
    private OfferValidator offerValidator;

    @RequestMapping(value = "/create_offer", method = RequestMethod.GET)
    public String createOffer(Model model) {
        model.addAttribute("offerForm", new OffersEntity());

        return "create_offer";
    }

    @RequestMapping(value = "/create_offer", method = RequestMethod.POST)
    public String createOffer(@ModelAttribute("offerForm") OffersEntity offerForm, BindingResult bindingResult, Model model) {
        offerValidator.validate(offerForm, bindingResult);

        if (bindingResult.hasErrors()) {
            return "create_offer";
        }

        offerService.save(offerForm);

        return "redirect:/welcome";
    }

}
