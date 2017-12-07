package com.fintechviet.ads.service;

import com.fintechviet.ads.model.Flight;

import java.util.List;

public interface FlightService {
    void save(Flight flight);
    void delete(Flight flight);
    List<Flight> getAllFlights();
    void updateStatus(Long id, String status);
}
