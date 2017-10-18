package com.fintechviet.content.web;

import com.fintechviet.content.model.News;
import com.fintechviet.content.request.ContentRequest;
import com.fintechviet.content.service.NewsService;
import com.fintechviet.utils.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import java.util.Arrays;
import java.util.Date;
import java.util.List;

/**
 * Created by tungn on 9/12/2017.
 */
@RestController
public class NewsRestController {
    @Autowired
    private NewsService newsService;

    @RequestMapping(value = "/content/newsList", method = RequestMethod.GET)
    public List<News> newsList(){
        return newsService.getAllNews();
    }

    @RequestMapping(value = "/deleteNews", method = RequestMethod.POST)
    public ResponseEntity<?> deleteNews(@RequestBody News news) {
        try {
            newsService.delete(news);
        } catch (Exception ex) {
            return ResponseEntity.badRequest().body("Error");
        }
        return ResponseEntity.ok(news);
    }

    @RequestMapping(value = "/activateNews", method = RequestMethod.POST)
    public ResponseEntity<?> activateCreative(@RequestBody News news) {
        try {
            String status = news.getStatus().equals("ACTIVE") ? "INACTIVE" : "ACTIVE";
            newsService.updateStatus(news.getId(), status);
        } catch (Exception ex) {
            return ResponseEntity.badRequest().body("Error");
        }
        return ResponseEntity.ok(news.getId());
    }
}

