package com.fintechviet.ads.service;

import com.fintechviet.ads.model.Ad;
import com.fintechviet.ads.repository.AdRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class AServiceImpl implements AdService {
    @Autowired
    private AdRepository adRepository;

    @Override
    public void save(Ad ad) {
        adRepository.save(ad);
    }

    @Override
    public void delete(Ad ad) {
        adRepository.delete(ad);
    }

    @Override
    public List<Ad> getAllAds() {
        return adRepository.findAll();
    }
}
