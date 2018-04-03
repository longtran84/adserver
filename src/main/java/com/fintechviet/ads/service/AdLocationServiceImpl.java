package com.fintechviet.ads.service;

import com.fintechviet.ads.model.AdLocation;
import com.fintechviet.ads.repository.AdLocationRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class AdLocationServiceImpl implements AdLocationService {
    @Autowired
    private AdLocationRepository adLocationRepository;

    @Override
    public void save(AdLocation adLocation) {
        adLocationRepository.save(adLocation);
    }

    @Override
    public void delete(AdLocation adLocation) {
        adLocationRepository.delete(adLocation);
    }

    @Override
    public List<AdLocation> getAllAdLocation() {
        return adLocationRepository.findAll();
    }

    @Override
    public void updateStatus(Long id, String status) {
        adLocationRepository.updateStatus(status, id);
    }

    @Override
    public AdLocation getAdLocationById(long id) {
        return adLocationRepository.findOne(id);
    }

}
