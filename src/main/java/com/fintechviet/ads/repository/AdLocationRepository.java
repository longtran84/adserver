package com.fintechviet.ads.repository;

import com.fintechviet.ads.model.AdLocation;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.jpa.repository.Temporal;
import org.springframework.data.repository.query.Param;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import javax.persistence.TemporalType;
import java.util.Date;
import java.util.List;

/**
 * Created by tungn on 3/28/2018.
 */
public interface AdLocationRepository extends JpaRepository<AdLocation, Long> {
    @Modifying
    @Transactional(propagation = Propagation.REQUIRED, readOnly = false)
    @Query("UPDATE AdLocation SET status = :status WHERE id = :id")
    void updateStatus(@Param("status") String status, @Param("id") Long id);

    //Query active ad location by lat and lng
    @Query(value ="SELECT * FROM ad_location ad WHERE ad.flightId IN (SELECT id FROM flight WHERE startDate <= NOW() AND (endDate >= NOW() OR ad.flight.endDate IS NULL) " +
           "AND (3959 * acos(cos(radians(:lat)) * cos(radians(ad.lat)) * cos(radians(ad.lng) - radians(:lng)) + sin(radians(:lat)) * sin(radians(lat)))) < 500 AND ad.status = 'ACTIVE'", nativeQuery = true)
    List<Object[]> findAdLocationsNearBy(@Param("lng") Double lng, @Param("lat") Double lat);
}
