package com.fintechviet.ads.service;

import com.fintechviet.ads.model.AdType;
import com.fintechviet.ads.repository.AdTypeRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class AdTypeServiceImpl implements AdTypeService {
    @Autowired
    private AdTypeRepository adTypeRepository;

    @Override
    public List<AdType> getAllAdTypes() {
        return adTypeRepository.findAll();
    }
}
