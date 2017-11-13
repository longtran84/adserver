package com.fintechviet.content.web;

import com.fintechviet.ads.model.Ad;
import com.fintechviet.ads.service.AdService;
import com.fintechviet.ads.web.PushAdsHelper;
import com.fintechviet.content.model.InAppMessage;
import com.fintechviet.content.service.InAppMessageService;
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
public class InAppMessageRestController {
    @Autowired
    private InAppMessageService inAppMessageService;

    private static final Gson gson = new Gson();

    @RequestMapping(path = "/content/inAppMessages", method = RequestMethod.GET)
    public List<InAppMessage> getAllInAppMessages(){
        return inAppMessageService.getAllInAppMessages();
    }

    @RequestMapping(value = "/deleteMessage", method = RequestMethod.POST)
    public ResponseEntity<?> deleteAd(@RequestBody InAppMessage inAppMessage) {
        try {
            inAppMessageService.delete(inAppMessage);
        } catch (Exception ex) {
            return ResponseEntity.badRequest().body("Error");
        }
        return ResponseEntity.ok(inAppMessage);
    }

    @RequestMapping(value = "/content/activateMessage", method = RequestMethod.POST)
    public ResponseEntity<?> activateAd(@RequestBody InAppMessage inAppMessage) {
        try {
            String status = inAppMessage.getStatus().equals("ACTIVE") ? "INACTIVE" : "ACTIVE";
            inAppMessageService.updateStatus(inAppMessage.getId(), status);
        } catch (Exception ex) {
            return ResponseEntity.badRequest().body("Error");
        }
        return ResponseEntity.ok(inAppMessage.getId());
    }

    @RequestMapping(value = "/content/sendMessage", method = RequestMethod.POST)
    public ResponseEntity<?> pushAds(@RequestBody InAppMessage inAppMessage) {
        try {
            InAppMessage message = inAppMessageService.getById(inAppMessage.getId());
            inAppMessageService.sendMessage(message);
        } catch (Exception ex) {
            return ResponseEntity.badRequest().body("FAILURE");
        }
        return ResponseEntity.ok(gson.toJson("ok"));
    }
}
