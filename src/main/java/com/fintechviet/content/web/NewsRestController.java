package com.fintechviet.content.web;

import com.fintechviet.content.model.News;
import com.fintechviet.content.service.NewsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import java.util.Arrays;

/**
 * Created by tungn on 9/12/2017.
 */
@RestController
public class NewsRestController {
    @Autowired
    private NewsService newsService;

    @RequestMapping(value = "/news/saveNews", method = RequestMethod.POST)
    public ResponseEntity<?> saveNews(@RequestBody News[] news){
        try {
            newsService.save(Arrays.asList(news));
        } catch(Exception ex){
            return ResponseEntity.badRequest().body(ex.getMessage());
        }
        return ResponseEntity.ok("ok");
    }
}

