package com.fintechviet.loyalty.service;


import com.fintechviet.content.model.News;

import java.util.List;

public interface OrderService {
    News findById(Long id);
    void save(News news);
    void delete(News news);
    List<News> getAllNews();
    void updateStatus(Long id, String status);
}
