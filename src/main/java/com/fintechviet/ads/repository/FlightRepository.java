package com.fintechviet.ads.repository;

import com.fintechviet.ads.model.Flight;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

public interface FlightRepository extends JpaRepository<Flight, Long> {
    @Modifying
    @Transactional(propagation = Propagation.REQUIRED, readOnly = false)
    @Query("UPDATE Flight SET status = :status WHERE id = :id")
    void updateStatus(@Param("status") String status, @Param("id") Long id);
}
