package com.fintechviet.ads.web;

import com.fintechviet.ads.model.AdLocation;
import com.fintechviet.ads.service.AdLocationService;
import com.google.gson.Gson;
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
public class AdLocationRestController {
    @Autowired
    private AdLocationService adLocationService;

    private static final Gson gson = new Gson();

    @RequestMapping(path = "/adLocations", method = RequestMethod.GET)
    public List<AdLocation> getAllAdLocations(){
        return adLocationService.getAllAdLocation();
    }

    @RequestMapping(value = "/deleteAdLocation", method = RequestMethod.POST)
    public ResponseEntity<?> deleteAd(@RequestBody AdLocation adLocation) {
        try {
            adLocationService.delete(adLocation);
        } catch (Exception ex) {
            return ResponseEntity.badRequest().body("Error");
        }
        return ResponseEntity.ok(adLocation);
    }

    @RequestMapping(value = "/activateAdLocation", method = RequestMethod.POST)
    public ResponseEntity<?> activateAd(@RequestBody AdLocation adLocation) {
        try {
            String status = adLocation.getStatus().equals("ACTIVE") ? "INACTIVE" : "ACTIVE";
            adLocationService.updateStatus(adLocation.getId(), status);
        } catch (Exception ex) {
            return ResponseEntity.badRequest().body("Error");
        }
        return ResponseEntity.ok(adLocation.getId());
    }

}
