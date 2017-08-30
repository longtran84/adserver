package com.fintechviet.ads.web;

import com.fintechviet.ads.model.Advertiser;
import com.fintechviet.ads.service.AdvertiserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * Created by tungn on 8/21/2017.
 */
@RestController
public class AdvertiserRestController {
    @Autowired
    private AdvertiserService advertiserService;

    @RequestMapping(path = "/advertisers", method = RequestMethod.GET)
    public List<Advertiser> getAllAdvertisers(){
        return advertiserService.getAllAdvertisers();
    }

    @RequestMapping(value = "/deleteAdvertiser", method = RequestMethod.POST)
    public ResponseEntity<?> deleteAdvertiser(@RequestBody Advertiser advertiser) {
        try {
             advertiserService.delete(advertiser);
        } catch (Exception ex) {
            return ResponseEntity.badRequest().body("Error");
        }
        return ResponseEntity.ok(advertiser);
    }

    @RequestMapping(value = "/searchAdvertiser", method = RequestMethod.POST)
    public List<Advertiser> searchAdvertiser(@RequestBody Advertiser advertiser) {
        return advertiserService.search(advertiser);
    }
}
