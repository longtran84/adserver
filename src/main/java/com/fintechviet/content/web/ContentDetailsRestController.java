package com.fintechviet.content.web;

import com.fintechviet.content.model.ContentDetails;
import com.fintechviet.content.service.ContentDetailsService;
import com.google.gson.Gson;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * Created by tungn on 8/21/2017.
 */
@RestController
public class ContentDetailsRestController {
    @Autowired
    private ContentDetailsService contentDetailsService;

    private static final Gson gson = new Gson();

    @RequestMapping(path = "/contentDetails", method = RequestMethod.GET)
    public List<ContentDetails> getAllContentDetails(@RequestParam("contentId") long contentId){
        return contentDetailsService.getContentDetailsByContentId(contentId);
    }

    @RequestMapping(value = "/deleteContentDetail", method = RequestMethod.POST)
    public ResponseEntity<?> deleteContentDetail(@RequestBody ContentDetails contentDetails) {
        try {
            contentDetailsService.delete(contentDetails);
        } catch (Exception ex) {
            return ResponseEntity.badRequest().body("Error");
        }
        return ResponseEntity.ok(contentDetails.getId());
    }

    @RequestMapping(value = "/updateImageOrder", method = RequestMethod.POST)
    public ResponseEntity<?> updateImageOrder(@RequestParam("contentDetailIds") String contentDetailIds) {
        try {
            String[] ids = contentDetailIds.split(",");
            contentDetailsService.updateOrders(ids);
        } catch (Exception ex) {
            return ResponseEntity.badRequest().body("Error");
        }
        return ResponseEntity.ok(gson.toJson("ok"));
    }
}
