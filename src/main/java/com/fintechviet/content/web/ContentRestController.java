package com.fintechviet.content.web;


import com.fintechviet.content.model.Content;
import com.fintechviet.content.service.ContentService;
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
public class ContentRestController {
    @Autowired
    private ContentService contentService;

    private static final Gson gson = new Gson();

    @RequestMapping(path = "/contents", method = RequestMethod.GET)
    public List<Content> getAllContents(){
        return contentService.getAllContents();
    }

    @RequestMapping(value = "/deleteContent", method = RequestMethod.POST)
    public ResponseEntity<?> deleteContent(@RequestBody Content content) {
        try {
            contentService.delete(content);
        } catch (Exception ex) {
            return ResponseEntity.badRequest().body("Error");
        }
        return ResponseEntity.ok(content.getId());
    }

    @RequestMapping(value = "/activateContent", method = RequestMethod.POST)
    public ResponseEntity<?> activateAd(@RequestBody Content content) {
        try {
            String status = content.getStatus().equals("ACTIVE") ? "INACTIVE" : "ACTIVE";
            contentService.updateStatus(content.getId(), status);
        } catch (Exception ex) {
            return ResponseEntity.badRequest().body("Error");
        }
        return ResponseEntity.ok(content.getId());
    }
}
