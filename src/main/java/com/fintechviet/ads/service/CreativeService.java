package com.fintechviet.ads.service;

import com.fintechviet.ads.model.Creative;

import java.util.List;

public interface CreativeService {
    void save(Creative creative);
    void delete(Creative creative);
    List<Creative> getCreativesByTemplate(String template);
}
