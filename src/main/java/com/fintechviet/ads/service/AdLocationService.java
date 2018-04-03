package com.fintechviet.ads.service;

import com.fintechviet.ads.model.AdLocation;

import java.util.List;

public interface AdLocationService {
    void save(AdLocation adLocation);
    void delete(AdLocation adLocation);
    List<AdLocation> getAllAdLocation();
    void updateStatus(Long id, String status);
    AdLocation getAdLocationById(long id);
}
