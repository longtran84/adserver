package com.fintechviet.ads.repository;

import com.fintechviet.ads.model.Flight;
import org.springframework.data.jpa.repository.JpaRepository;

public interface FlightRepository extends JpaRepository<Flight, Long> {
}
