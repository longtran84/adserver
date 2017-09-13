package com.fintechviet.ads.service;

import com.fintechviet.ads.model.Ad;

import java.util.List;

public interface AdService {
    void save(Ad ad);
    void delete(Ad ad);
    List<Ad> getAllAds();
    List<Ad> getAdByAdvertiser(String adverEmail);
    void updateStatus(Long id, String status);
    List<Ad> getAdActive();
}
