package com.fintechviet.ads.web;

import com.fintechviet.ads.model.Creative;
import com.fintechviet.ads.service.CreativeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

/**
 * Created by tungn on 8/21/2017.
 */
@RestController
public class CreativeRestController {
    @Autowired
    private CreativeService creativeService;

    @RequestMapping(path = "/creativeVideos", method = RequestMethod.GET)
    public List<Creative> getCreativeVideos(){
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        boolean hasAdminRole = auth.getAuthorities().stream()
                .anyMatch(r -> (r.getAuthority().equals("ROLE_ADMIN") || r.getAuthority().equals("ROLE_SUPER_ADMIN")));
        if (hasAdminRole) {
            return creativeService.getCreativesByTemplate("video");
        } else {
            return  creativeService.getCreativeByAdvertiserAndTemplate(auth.getName(), "video") ;
        }
    }

    @RequestMapping(path = "/creativeImages", method = RequestMethod.GET)
    public List<Creative> getCreativeImages(){
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        boolean hasAdminRole = auth.getAuthorities().stream()
                .anyMatch(r -> (r.getAuthority().equals("ROLE_ADMIN") || r.getAuthority().equals("ROLE_SUPER_ADMIN")));
        if (hasAdminRole) {
            return creativeService.getCreativesByTemplate("image");
        } else {
            return  creativeService.getCreativeByAdvertiserAndTemplate(auth.getName(), "image") ;
        }
    }

    @RequestMapping(path = "/creatives", method = RequestMethod.GET)
    public List<Creative> getCreatives() {
    	Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        boolean hasAdminRole = auth.getAuthorities().stream()
                .anyMatch(r -> (r.getAuthority().equals("ROLE_ADMIN") || r.getAuthority().equals("ROLE_SUPER_ADMIN")));
        if (hasAdminRole) {
        	return creativeService.getAllCreatives();
        } else {
        	return creativeService.getCreativeByAdvertiser(auth.getName());
        }
    }

    @RequestMapping(value = "/deleteCreative", method = RequestMethod.POST)
    public ResponseEntity<?> deleteCreative(@RequestBody Creative creative) {
        try {
            creativeService.delete(creative);
        } catch (Exception ex) {
            return ResponseEntity.badRequest().body("Error");
        }
        return ResponseEntity.ok(creative);
    }

    @RequestMapping(value = "/activateCreative", method = RequestMethod.POST)
    public ResponseEntity<?> activateCreative(@RequestBody Creative creative) {
        try {
            String status = creative.getStatus().equals("ACTIVE") ? "INACTIVE" : "ACTIVE";
            creativeService.updateStatus(creative.getId(), status);
        } catch (Exception ex) {
            return ResponseEntity.badRequest().body("Error");
        }
        return ResponseEntity.ok(creative.getId());
    }
}
