package com.fintechviet.content.service;

import com.fintechviet.content.model.InAppMessage;
import com.fintechviet.content.repository.InAppMessageRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class InAppMessageServiceImpl implements InAppMessageService {

    @Autowired
    private InAppMessageRepository inAppMessageRepository;

    @Override
    public void save(InAppMessage inAppMessage) {
        inAppMessageRepository.save(inAppMessage);
    }

    @Override
    public void delete(InAppMessage inAppMessage) {
        inAppMessageRepository.delete(inAppMessage);
    }

    @Override
    public void updateStatus(Long id, String status) {
        inAppMessageRepository.updateStatus(status, id);
    }

    @Override
    public List<InAppMessage> getAllInAppMessages() {
        return inAppMessageRepository.findAll();
    }
}

