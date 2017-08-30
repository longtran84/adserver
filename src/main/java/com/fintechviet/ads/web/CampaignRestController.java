package com.fintechviet.ads.web;

import com.fintechviet.ads.model.Campaign;
import com.fintechviet.ads.service.CampaignService;
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
public class CampaignRestController {
    @Autowired
    private CampaignService campaignService;

    @RequestMapping(path = "/campaigns", method = RequestMethod.GET)
    public List<Campaign> getAllCampaigns(){
        return campaignService.getAllCampaigns();
    }

    @RequestMapping(value = "/deleteCampaign", method = RequestMethod.POST)
    public ResponseEntity<?> deleteCampaign(@RequestBody Campaign campaign) {
        try {
            campaignService.delete(campaign);
        } catch (Exception ex) {
            return ResponseEntity.badRequest().body("Error");
        }
        return ResponseEntity.ok(campaign);
    }
}
