package com.fintechviet.content.service;


import com.fintechviet.content.model.InAppMessage;

import java.util.List;

public interface InAppMessageService {
    void save(InAppMessage inAppMessage);
    void delete(InAppMessage inAppMessage);
    List<InAppMessage> getAllInAppMessages();
    void updateStatus(Long id, String status);
}
