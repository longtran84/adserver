package com.fintechviet.content.service;

import com.fintechviet.content.dto.UserInterestDTO;
import com.fintechviet.content.model.NewsCategory;

import java.util.List;

public interface NewsCategoryService {
    List<UserInterestDTO> getUserInterestReport();
    void save(NewsCategory newsCategory);
    List<NewsCategory> getAllNewCategories();
}
