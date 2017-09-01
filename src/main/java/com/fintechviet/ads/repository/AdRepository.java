package com.fintechviet.ads.repository;

import com.fintechviet.ads.model.Ad;
import org.springframework.data.jpa.repository.JpaRepository;

public interface AdRepository extends JpaRepository<Ad, Long> {
}
