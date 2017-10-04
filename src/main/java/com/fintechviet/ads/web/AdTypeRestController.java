package com.fintechviet.ads.web;

import com.fintechviet.ads.model.AdType;
import com.fintechviet.ads.service.AdTypeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

/**
 * Created by tungn on 8/21/2017.
 */
@RestController
public class AdTypeRestController {
    @Autowired
    private AdTypeService adTypeService;

    @RequestMapping(path = "/adTypes", method = RequestMethod.GET)
    public List<AdType> getAllAds(){
        return adTypeService.getAllAdTypes();
    }
}
