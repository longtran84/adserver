package com.fintechviet.ads.service;

import com.fintechviet.ads.model.Ad;
import com.fintechviet.ads.model.Creative;
import com.fintechviet.ads.repository.AdRepository;
import com.fintechviet.ads.repository.CreativeRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Set;

@Service
public class CreativeServiceImpl implements CreativeService {
    @Autowired
    private CreativeRepository creativeRepository;
    @Autowired
    private AdRepository adRepository;

    @Override
    public Creative findById(Long id) {
        return creativeRepository.findOne(id);
    }

    @Override
    public void save(Creative creative) {
        creativeRepository.save(creative);
    }

    @Override
    public void delete(Creative creative) {
        creativeRepository.delete(creative);
    }

    @Override
    public List<Creative> getCreativesByTemplate(String template) {
        return creativeRepository.findByTemplate(template);
    }

    @Override
    public List<Creative> getAllCreatives() {
        return creativeRepository.findAll();
    }

    @Override
    public void updateStatus(Long id, String status) {
        creativeRepository.updateStatus(status, id);
        if ("INACTIVE".equals(status)) {
            Creative creative = creativeRepository.findOne(id);
            Set<Ad> ads = creative.getAds();
            ads.stream().forEach(ad -> ad.setStatus("INACTIVE"));
            adRepository.save(ads);
        }
    }

}
