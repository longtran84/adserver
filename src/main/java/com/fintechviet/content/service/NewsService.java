package com.fintechviet.content.service;

import com.fintechviet.content.dto.UserInterestDTO;
import com.fintechviet.content.model.News;
import com.fintechviet.content.model.NewsCategory;

import java.util.List;

public interface NewsService {
    void save(List<News> news);
}
