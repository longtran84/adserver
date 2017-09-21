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

    @RequestMapping(value = "/news/saveNews", method = RequestMethod.POST)
    public ResponseEntity<?> saveNews(@RequestBody News[] news){
        try {
            newsService.save(Arrays.asList(news));
        } catch(Exception ex){
            return ResponseEntity.badRequest().body(ex.getMessage());
        }
        return ResponseEntity.ok("ok");
    }

    @RequestMapping(value = "/news/list", method = RequestMethod.POST)
    public List<News> inventoryReports(@RequestBody ContentRequest request){
        Date from = DateUtils.convertStringToDate(request.getDateFrom()  + " 00:00:00");
        Date to = DateUtils.convertStringToDate(request.getDateTo() + " 23:59:59");
        List<News> news = newsService.getNewsByDate(from, to);
        return newsService.getNewsByDate(from, to);
    }

    @RequestMapping(value = "/news/publish", method = RequestMethod.POST)
    public ResponseEntity<?> activateCampaign(@RequestBody News news) {
        try {
            String status = news.getStatus().equals("ACTIVE") ? "INACTIVE" : "ACTIVE";
            newsService.updateStatus(news.getId(), status);
        } catch (Exception ex) {
            return ResponseEntity.badRequest().body("Error");
        }
        return ResponseEntity.ok(news.getId());
    }
}

