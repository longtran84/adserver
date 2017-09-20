package com.fintechviet.content.service;


import com.fintechviet.content.model.News;

import java.util.Date;
import java.util.List;

public interface NewsService {
    void save(List<News> news);
    List<News> getNewsByDate(Date from, Date to);
    void getNewsFromCrawler();
}
