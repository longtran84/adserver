package com.fintechviet.ads.service;

import com.fintechviet.ads.model.Creative;
import com.fintechviet.ads.repository.CreativeRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class CreativeServiceImpl implements CreativeService {
    @Autowired
    private CreativeRepository creativeRepository;

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
    public List<Creative> getCreativeByAdvertiserAndTemplate(String adverEmail, String template) {
        return creativeRepository.findByAdvertiserAndTemplate(adverEmail, template);
    }

    @Override
    public List<Creative> getAllCreatives() {
        return creativeRepository.findAll();
    }

    @Override
    public void updateStatus(Long id, String status) {
        creativeRepository.updateStatus(status, id);
    }
}
