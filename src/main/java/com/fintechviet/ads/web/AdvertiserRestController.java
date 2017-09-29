package com.fintechviet.ads.web;

import com.fintechviet.ads.model.Advertiser;
import com.fintechviet.ads.service.AdvertiserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * Created by tungn on 8/21/2017.
 */
@RestController
public class AdvertiserRestController {
    @Autowired
    private AdvertiserService advertiserService;

    @RequestMapping(value = "/advertisers", method = RequestMethod.GET)
    public List<Advertiser> getAllAdvertisers() {
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        boolean hasAdminRole = auth.getAuthorities().stream()
                .anyMatch(r -> r.getAuthority().equals("ROLE_ADMIN"));

        if (hasAdminRole) {
            return advertiserService.getAllAdvertisers();
        } else {
            return advertiserService.getAdvertiserByEmail(auth.getName());
        }
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

    @RequestMapping(value = "/activateAdvertiser", method = RequestMethod.POST)
    public ResponseEntity<?> activateCampaign(@RequestBody Advertiser advertiser) {
        try {
            String status = advertiser.getStatus().equals("ACTIVE") ? "INACTIVE" : "ACTIVE";
            advertiserService.updateStatus(advertiser.getId(), status);
        } catch (Exception ex) {
            return ResponseEntity.badRequest().body("Error");
        }
        return ResponseEntity.ok(advertiser.getId());
    }

    @RequestMapping(value = "/searchAdvertiser", method = RequestMethod.POST)
    public List<Advertiser> searchAdvertiser(@RequestBody Advertiser advertiser) {
        return advertiserService.search(advertiser);
    }
    
    @RequestMapping(value = "/{advertiserId}", method = RequestMethod.POST)
    public ResponseEntity<String> verifyAdvertiser(@PathVariable("advertiserId") Long advertiserId, @RequestParam("approved") boolean approved) {
        try {
        	advertiserService.approveAdvertisers(advertiserId, approved);
        } catch (Exception ex) {
            return ResponseEntity.badRequest().body("Error");
        }
        return ResponseEntity.ok(String.valueOf(advertiserId));
    }    
    
    
}
