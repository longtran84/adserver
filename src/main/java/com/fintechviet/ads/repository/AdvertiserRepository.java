package com.fintechviet.ads.repository;

import com.fintechviet.ads.model.Advertiser;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;

public interface AdvertiserRepository extends JpaRepository<Advertiser, Long>, JpaSpecificationExecutor<Advertiser> {
    Advertiser findByEmail(String email);
}
