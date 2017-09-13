package com.fintechviet.content.service;

import com.fintechviet.content.model.News;
import com.fintechviet.content.model.NewsCategory;
import com.fintechviet.content.repository.NewsRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class NewsServiceImpl implements NewsService {
    @Autowired
    private NewsRepository newsRepository;

    @Override
    public void save(List<News> news) {
        newsRepository.save(news);
    }
}

