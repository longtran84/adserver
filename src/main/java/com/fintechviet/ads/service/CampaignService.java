package com.fintechviet.ads.service;

import com.fintechviet.ads.model.Campaign;

import java.util.List;

public interface CampaignService {
    void save(Campaign campaign);
    void delete(Campaign campaign);
    List<Campaign> getAllCampaigns();
}
