package com.fintechviet.ads.service;

import com.fintechviet.ads.model.Creative;

import java.util.List;

public interface CreativeService {
    Creative findById(Long id);
    void save(Creative creative);
    void delete(Creative creative);
    List<Creative> getCreativesByTemplate(String template);
    List<Creative> getAllCreatives();
    void updateStatus(Long id, String status);
}
