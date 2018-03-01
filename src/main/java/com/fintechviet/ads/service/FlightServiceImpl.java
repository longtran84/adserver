package com.fintechviet.ads.service;

import com.fintechviet.ads.model.Ad;
import com.fintechviet.ads.model.Flight;
import com.fintechviet.ads.repository.AdRepository;
import com.fintechviet.ads.repository.FlightRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Set;

@Service
public class FlightServiceImpl implements FlightService {
    @Autowired
    private FlightRepository flightRepository;
    @Autowired
    private AdRepository adRepository;

    @Override
    public void save(Flight flight) {
        flightRepository.save(flight);
    }

    @Override
    public void delete(Flight flight) {
        flightRepository.delete(flight);
    }

    @Override
    public List<Flight> getAllFlights() {
        return flightRepository.findAll();
    }

    @Override
    public void updateStatus(Long id, String status) {
        flightRepository.updateStatus(status, id);
        if ("INACTIVE".equals(status)) {
            Flight flight = flightRepository.findOne(id);
            Set<Ad> ads = flight.getAds();
            ads.stream().forEach(ad -> ad.setStatus("INACTIVE"));
            adRepository.save(ads);
        }
    }
}
