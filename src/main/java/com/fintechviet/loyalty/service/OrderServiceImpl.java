package com.fintechviet.loyalty.service;

import com.fintechviet.content.model.News;
import com.fintechviet.content.repository.NewsRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class NewsServiceImpl implements NewsService {
    private static int ROWS = 5;

    @Autowired
    private NewsRepository newsRepository;

    @Override
    public News findById(Long id) {
        return newsRepository.findOne(id);
    }

    @Override
    public void save(News news) {
        newsRepository.save(news);
    }

    @Override
    public void delete(News news) {
        newsRepository.delete(news);
    }

    @Override
    public void updateStatus(Long id, String status) {
        newsRepository.updateStatus(status, id);
    }

    @Override
    public List<News> getAllNews() {
        return newsRepository.findAll();
    }
}

