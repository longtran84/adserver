package com.fintechviet.ads.web;

import com.fintechviet.ads.model.Ad;
import com.fintechviet.ads.service.AdService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

/**
 * Created by tungn on 8/21/2017.
 */
@RestController
public class AdRestController {
    @Autowired
    private AdService adService;

    @RequestMapping(path = "/ads", method = RequestMethod.GET)
    public List<Ad> getAllAds(){
        return adService.getAllAds();
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
}
