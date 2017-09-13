package com.fintechviet.ads.repository;

import com.fintechviet.ads.model.Ad;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.util.Date;
import java.util.List;

public interface AdRepository extends JpaRepository<Ad, Long> {
    @Query("SELECT ad FROM Ad ad WHERE ad.creative.advertiser.email = :email")
    List<Ad> findByAdvertiser(@Param("email") String email);

    @Modifying
    @Transactional(propagation = Propagation.REQUIRED, readOnly = false)
    @Query("UPDATE Ad SET status = :status WHERE id = :id")
    void updateStatus(@Param("status") String status, @Param("id") Long id);

    @Query("SELECT ad FROM Ad ad WHERE ad.flight.startDate <= CURRENT_DATE AND (ad.flight.endDate >= CURRENT_DATE OR ad.flight.endDate IS NULL) " +
           "AND ad.impressions > (SELECT COUNT(adi.id) FROM AdImpressions adi WHERE adi.ad.id = ad.id) AND ad.status = 'ACTIVE'")
    List<Ad> findAdActive();
}
