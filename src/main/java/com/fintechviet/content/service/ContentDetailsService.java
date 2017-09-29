package com.fintechviet.content.service;


import com.fintechviet.content.model.ContentDetails;

import java.util.List;

public interface ContentDetailsService {
    void save(ContentDetails contentDetails);
    void delete(ContentDetails contentDetails);
    List<ContentDetails> getContentDetailsByContentId(long contentId);
    void updateOrders(String[] ids);
}
