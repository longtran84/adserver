package com.fintechviet.content.service;

import com.fintechviet.content.model.Content;
import com.fintechviet.content.model.ContentDetails;
import com.fintechviet.content.repository.ContentDetailsRepository;
import com.fintechviet.content.repository.ContentRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ContentDetailsServiceImpl implements ContentDetailsService {
    @Autowired
    private ContentRepository contentRepository;

    @Autowired
    private ContentDetailsRepository contentDetailsRepository;

    @Override
    public void save(ContentDetails contentDetails) {
        Content content = contentRepository.findOne(contentDetails.getContId());
        contentDetails.setContent(content);
        Integer maxOrder = contentDetailsRepository.findMaxOrder(contentDetails.getContId());
        if (maxOrder == null) {
            maxOrder = 1;
        } else {
            maxOrder++;
        }
        contentDetails.setOrder(maxOrder);
        contentDetailsRepository.save(contentDetails);
    }

    @Override
    public void delete(ContentDetails contentDetails) {
        contentDetailsRepository.delete(contentDetails.getId());
    }

    @Override
    public List<ContentDetails> getContentDetailsByContentId(long contentId) {
        return contentDetailsRepository.findAll();
    }

    @Override
    public void updateOrders(String[] ids) {
        for (int i = 0; i < ids.length; i++) {
            ContentDetails contentDetails = contentDetailsRepository.findOne(Long.valueOf(ids[i]));
            contentDetails.setOrder(i + 1);
            contentDetailsRepository.save(contentDetails);
        }
    }
}
