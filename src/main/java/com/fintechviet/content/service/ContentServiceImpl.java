package com.fintechviet.content.service;

import com.fintechviet.content.model.Content;
import com.fintechviet.content.repository.ContentRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ContentServiceImpl implements ContentService {
    @Autowired
    private ContentRepository contentRepository;

    @Override
    public void save(Content content) {
        contentRepository.save(content);
    }

    @Override
    public void delete(Content content) {
        contentRepository.delete(content);
    }

    @Override
    public List<Content> getAllContents() {
        return contentRepository.findAll();
    }

    @Override
    public void updateStatus(Long id, String status) {
        contentRepository.updateStatus(status, id);
    }

    @Override
    public Content findById(long id) {
        return contentRepository.findOne(id);
    }
}
