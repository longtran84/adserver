package com.fintechviet.ads.service;

import com.fintechviet.ads.model.Ad;

import java.util.List;

public interface AdService {
    void save(Ad ad);
    void delete(Ad ad);
    List<Ad> getAllAds();
    void updateStatus(Long id, String status);
    Ad getAdById(long id);
    List<Ad> findActiveAdvs();
}
