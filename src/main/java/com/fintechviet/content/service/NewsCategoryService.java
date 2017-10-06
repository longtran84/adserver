package com.fintechviet.content.service;

import com.fintechviet.content.dto.UserInterestDTO;
import com.fintechviet.content.model.NewsCategory;

import java.util.List;

public interface NewsCategoryService {
    NewsCategory findById(Long id);
    List<UserInterestDTO> getUserInterestReport();
    void save(NewsCategory newsCategory);
    void delete(NewsCategory newsCategory);
    List<NewsCategory> getAllNewCategories();
    void updateStatus(Long id, String status);
}
