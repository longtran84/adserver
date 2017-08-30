package com.fintechviet.ads;

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

import java.io.IOException;

/**
 * Created by tungn on 8/4/2017.
 */
@Controller
public class PushAdsController {

    @RequestMapping(value = "/push_ads", method = RequestMethod.GET)
    public String pushAds() {
        try {
            PushAdsHelper.sendPushAds("1:373715018719:android:984a277669e564aa");
        } catch (IOException ex) {
        }
        return "redirect:/welcome";
    }

}
