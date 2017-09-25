package com.fintechviet.content.service;

import com.fintechviet.content.dto.UserInterestDTO;
import com.fintechviet.content.model.NewsCategory;
import com.fintechviet.content.repository.NewsCategoryRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service
public class NewsCategoryServiceImpl implements NewsCategoryService {
    @Autowired
    private NewsCategoryRepository newsCategoryRepository;

    @Override
    public List<UserInterestDTO> getUserInterestReport() {
        List<NewsCategory> newsCategories =  newsCategoryRepository.findAll();
        List<UserInterestDTO> userInterestDTOS = new ArrayList<UserInterestDTO>();
        for (NewsCategory newsCategory : newsCategories) {
            UserInterestDTO userInterestDTO = new UserInterestDTO();
            userInterestDTO.setNewsCategoryName(newsCategory.getName());
            userInterestDTO.setNoOfUsers(newsCategory.getUserMobiles().size());
            userInterestDTOS.add(userInterestDTO);
        }
        return userInterestDTOS;
    }

    @Override
    public void save(NewsCategory newsCategory) {
        newsCategoryRepository.save(newsCategory);
    }

    @Override
    public void delete(NewsCategory newsCategory) {
        newsCategoryRepository.delete(newsCategory);
    }

    @Override
    public List<NewsCategory> getAllNewCategories() {
        return newsCategoryRepository.findAll();
    }
}

