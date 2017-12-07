package com.fintechviet.loyalty.service;

import com.fintechviet.loyalty.model.Phonecard;
import com.fintechviet.loyalty.respository.PhonecardRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class PhonecardServiceImpl implements PhonecardService {
    @Autowired
    private PhonecardRepository phonecardRepository;

    @Override
    public void save(Phonecard phonecard) {
        phonecardRepository.save(phonecard);
    }

    @Override
    public void delete(Phonecard phonecard) {
        phonecardRepository.delete(phonecard);
    }

    @Override
    public List<Phonecard> getPhonecards() {
        return phonecardRepository.findAll();
    }

    @Override
    public void updateStatus(Integer id, String status) {
        phonecardRepository.updateStatus(status, id);
    }
}
