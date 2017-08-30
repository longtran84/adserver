package com.fintechviet.ads.service;

import com.fintechviet.ads.model.Advertiser;

import java.util.List;

public interface AdvertiserService {
    void save(Advertiser advertiser);
    void delete(Advertiser advertiser);
    Advertiser findByEmail(String email);
    List<Advertiser> search(Advertiser advertiser);
    List<Advertiser> getAllAdvertisers();
}
