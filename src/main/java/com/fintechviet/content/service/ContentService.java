package com.fintechviet.content.service;


import com.fintechviet.content.model.Content;
import com.fintechviet.content.model.News;

import java.util.Date;
import java.util.List;

public interface ContentService {
    void save(Content content);
    void delete(Content content);
    List<Content> getAllContents();
    void updateStatus(Long id, String status);
    Content findById(long id);
}
