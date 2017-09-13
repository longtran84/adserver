package com.fintechviet.content.web;

import com.fintechviet.content.dto.UserInterestDTO;
import com.fintechviet.content.model.NewsCategory;
import com.fintechviet.content.service.NewsCategoryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import java.util.Arrays;
import java.util.List;

/**
 * Created by tungn on 9/12/2017.
 */
@RestController
public class NewsCategoryRestController {
    @Autowired
    private NewsCategoryService newsCategoryService;

    @RequestMapping(value = "/userInterestReports", method = RequestMethod.POST)
    public List<UserInterestDTO> getUserInterestReports(){
        return newsCategoryService.getUserInterestReport();
    }

    @RequestMapping(value = "/news/saveNewsCategories", method = RequestMethod.POST)
    public ResponseEntity<?> saveNewsCategories(@RequestBody NewsCategory[] newsCategories){
        try {
            newsCategoryService.save(Arrays.asList(newsCategories));
        } catch(Exception ex){
            ex.printStackTrace();
            //return ResponseEntity.badRequest().body("Error1");
        }
        return ResponseEntity.ok("ok");
    }
}

