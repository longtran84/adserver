package com.fintechviet.content.web;

import com.fintechviet.content.model.News;
import com.fintechviet.content.service.NewsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class NewsDetailController {

    @Autowired
    private NewsService newsService;

    @RequestMapping(value = "/newsDetail", method = RequestMethod.GET)
    public String newsDetail(@RequestParam("newsId") long newsId, Model model) {
        News news = newsService.findById(newsId);
        model.addAttribute("news", news);

        return "news_detail";
    }
}
