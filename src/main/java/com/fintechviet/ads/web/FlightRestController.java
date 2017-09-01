package com.fintechviet.ads.web;

import com.fintechviet.ads.model.Flight;
import com.fintechviet.ads.service.FlightService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

/**
 * Created by tungn on 8/21/2017.
 */
@RestController
public class FlightRestController {
    @Autowired
    private FlightService flightService;

    @RequestMapping(path = "/flights", method = RequestMethod.GET)
    public List<Flight> getAllFlights(){
        return flightService.getAllFlights();
    }

    @RequestMapping(value = "/deleteFlight", method = RequestMethod.POST)
    public ResponseEntity<?> deleteFlight(@RequestBody Flight flight) {
        try {
            flightService.delete(flight);
        } catch (Exception ex) {
            return ResponseEntity.badRequest().body("Error");
        }
        return ResponseEntity.ok(flight);
    }
}
