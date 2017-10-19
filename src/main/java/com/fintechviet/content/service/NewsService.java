package com.fintechviet.content.service;


import com.fintechviet.content.model.News;
import java.util.List;

public interface NewsService {
    News findById(Long id);
    void save(News news);
    void delete(News news);
    List<News> getAllNews();
    void updateStatus(Long id, String status);
}
