package com.fintechviet.loyalty.service;

import com.fintechviet.loyalty.model.Phonecard;

import java.util.List;

public interface PhonecardService {
    Phonecard findById(Integer id);
    void save(Phonecard game);
    void delete(Phonecard game);
    void updateStatus(Integer id, String status);
    List<Phonecard> getPhonecards();
    String findPhoneCardCodeByPhoneCardId(Integer phoneCardId);
}
