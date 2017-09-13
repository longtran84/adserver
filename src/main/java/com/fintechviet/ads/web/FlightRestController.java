package com.fintechviet.ads.web;

import com.fintechviet.ads.model.Flight;
import com.fintechviet.ads.service.FlightService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
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
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        boolean hasAdminRole = auth.getAuthorities().stream()
                .anyMatch(r -> r.getAuthority().equals("ROLE_ADMIN"));
        if (hasAdminRole) {
            return flightService.getAllFlights();
        } else {
            return flightService.getFlightByAdvertiser(auth.getName());
        }
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

    @RequestMapping(value = "/activateFlight", method = RequestMethod.POST)
    public ResponseEntity<?> activateFlight(@RequestBody Flight flight) {
        try {
            String status = flight.getStatus().equals("ACTIVE") ? "INACTIVE" : "ACTIVE";
            flightService.updateStatus(flight.getId(), status);
        } catch (Exception ex) {
            return ResponseEntity.badRequest().body("Error");
        }
        return ResponseEntity.ok(flight.getId());
    }
}
