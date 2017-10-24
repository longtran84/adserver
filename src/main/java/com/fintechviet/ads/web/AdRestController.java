package com.fintechviet.ads.web;

import com.fintechviet.ads.model.Ad;
import com.fintechviet.ads.service.AdService;
import com.google.gson.Gson;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import java.io.IOException;
import java.util.List;

/**
 * Created by tungn on 8/21/2017.
 */
@RestController
public class AdRestController {
    @Autowired
    private AdService adService;

    private static final Gson gson = new Gson();

    @RequestMapping(path = "/ads", method = RequestMethod.GET)
    public List<Ad> getAllAds(){
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        boolean hasAdminRole = auth.getAuthorities().stream()
                .anyMatch(r -> (r.getAuthority().equals("ROLE_ADMIN") || r.getAuthority().equals("ROLE_SUPER_ADMIN")));
        if (hasAdminRole) {
            return adService.getAllAds();
        } else {
            return adService.getAdByAdvertiser(auth.getName());
        }
    }

    @RequestMapping(value = "/deleteAd", method = RequestMethod.POST)
    public ResponseEntity<?> deleteAd(@RequestBody Ad ad) {
        try {
            adService.delete(ad);
        } catch (Exception ex) {
            return ResponseEntity.badRequest().body("Error");
        }
        return ResponseEntity.ok(ad);
    }

    @RequestMapping(value = "/activateAd", method = RequestMethod.POST)
    public ResponseEntity<?> activateAd(@RequestBody Ad ad) {
        try {
            String status = ad.getStatus().equals("ACTIVE") ? "INACTIVE" : "ACTIVE";
            adService.updateStatus(ad.getId(), status);
        } catch (Exception ex) {
            return ResponseEntity.badRequest().body("Error");
        }
        return ResponseEntity.ok(ad.getId());
    }

    @RequestMapping(value = "/pushAd", method = RequestMethod.POST)
    public ResponseEntity<?> pushAds(@RequestBody Ad ad) {
        String result;
        try {
            Ad a = adService.getAdById(ad.getId());
            result = PushAdsHelper.sendPushAds(a);
        } catch (IOException ex) {
            return ResponseEntity.badRequest().body("FAILURE");
        }
        return ResponseEntity.ok(gson.toJson(result));
    }
}
