package com.fintechviet.loyalty.web;

import com.fintechviet.content.model.Game;
import com.fintechviet.loyalty.model.Phonecard;
import com.fintechviet.loyalty.service.PhonecardService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

/**
 * Created by tungn on 9/12/2017.
 */
@RestController
public class PhonecardRestController {
    @Autowired
    private PhonecardService phonecardService;

    @RequestMapping(value = "/loyalty/phoneCards", method = RequestMethod.GET)
    public List<Phonecard> phoneCards(){
        return phonecardService.getPhonecards();
    }


    @RequestMapping(value = "/loyalty/phoneCard/deletePhoneCard", method = RequestMethod.POST)
    public ResponseEntity<?> deletePhoneCard(@RequestBody Phonecard phonecard) {
        try {
            phonecardService.delete(phonecard);
        } catch (Exception ex) {
            return ResponseEntity.badRequest().body("Error");
        }
        return ResponseEntity.ok(phonecard);
    }
    
    @RequestMapping(value = "/loyalty/phoneCard/activatePhoneCard", method = RequestMethod.POST)
    public ResponseEntity<?> activateGame(@RequestBody Game game) {
        try {
            String status = game.getStatus().equals("ACTIVE") ? "INACTIVE" : "ACTIVE";
            phonecardService.updateStatus(game.getId(), status);
        } catch (Exception ex) {
            return ResponseEntity.badRequest().body("Error");
        }
        return ResponseEntity.ok(game.getId());
    }
    
}

