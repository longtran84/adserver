package com.fintechviet.loyalty.service;

import com.fintechviet.loyalty.model.Phonecard;
import com.fintechviet.loyalty.repository.PhonecardRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class PhonecardServiceImpl implements PhonecardService {
    @Autowired
    private PhonecardRepository phonecardRepository;

    @Override
    public Phonecard findById(Integer id) {
        return phonecardRepository.findOne(id);
    }

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

    @Override
    public String findPhoneCardCodeByPhoneCardId(Integer phoneCardId) {
        return phonecardRepository.findPhoneCardCodeByPhoneCardId(phoneCardId);
    }
}
