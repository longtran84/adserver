package com.fintechviet.ads.repository;

import com.fintechviet.ads.model.Campaign;
import org.springframework.data.jpa.repository.JpaRepository;

public interface CampaignRepository extends JpaRepository<Campaign, Long> {
}
