package com.fintechviet.content.service;

import com.fintechviet.content.model.InAppMessage;
import com.fintechviet.content.model.NewsCategory;
import com.fintechviet.content.repository.InAppMessageRepository;
import com.fintechviet.user_mobile.model.Message;
import com.fintechviet.user_mobile.model.UserMobile;
import com.fintechviet.user_mobile.repository.MessageRepository;
import com.fintechviet.user_mobile.repository.UserMobileRepository;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

@Service
public class InAppMessageServiceImpl implements InAppMessageService {

    @Autowired
    private InAppMessageRepository inAppMessageRepository;

    @Autowired
    private UserMobileRepository userMobileRepository;

    @Autowired
    private MessageRepository messageRepository;

    @Override
    public InAppMessage getById(Long id) {
        return inAppMessageRepository.findOne(id);
    }

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

    @Override
    public void sendMessage(InAppMessage inAppMessage) {
        Calendar cal = Calendar.getInstance();
        int currentYear = cal.get(Calendar.YEAR);
        List<UserMobile> userMobiles = userMobileRepository.getUserActives();
        List<Message> messages = new ArrayList<Message>();
        int count = 0;
        if (StringUtils.isNotEmpty(inAppMessage.getUserGender())
            || inAppMessage.getUserAgeFrom() != 0 || inAppMessage.getUserAgeTo() != 0
            || StringUtils.isNotEmpty(inAppMessage.getUserLocation())) {
            List<String> userInterests = new ArrayList<String>();
            for (UserMobile user : userMobiles) {
                userInterests.clear();
                for (NewsCategory newsCategory : user.getNewsCategories()) {
                    userInterests.add(newsCategory.getCode());
                }
                boolean isContainInterest = false;
                if (StringUtils.isNotEmpty(inAppMessage.getUserInterest())) {
                    for (String userInterest : userInterests) {
                        if (inAppMessage.getUserInterest().contains(userInterest)) {
                            isContainInterest = true;
                            break;
                        }
                    }
                }
                if ((StringUtils.isNotEmpty(inAppMessage.getUserGender()) && inAppMessage.getUserGender().equals(user.getGender()))
                        || (inAppMessage.getUserAgeFrom() != 0 && inAppMessage.getUserAgeTo() != 0 && inAppMessage.getUserAgeFrom() <= (currentYear - user.getDob()) && inAppMessage.getUserAgeTo() >= (currentYear - user.getDob()))
                        || (StringUtils.isNotEmpty(inAppMessage.getUserLocation()) && inAppMessage.getUserLocation().contains(user.getLocation()))
                        || (StringUtils.isNotEmpty(inAppMessage.getUserInterest()) && isContainInterest)) {
                    Message message = new Message();
                    message.setSubject(inAppMessage.getSubject());
                    message.setBody(inAppMessage.getBody());
                    message.setUser(user);
                    message.setType(inAppMessage.getType());
                    if ("PRIMARY".equals(inAppMessage.getType())) {
                        message.setReceive(Byte.valueOf("1"));
                    }
                    messages.add(message);
                    count++;
                }
                if (count == 50 || userMobiles.size() < 50) {
                    messageRepository.save(messages);
                    messages.clear();
                }
            }
        } else {
            for (UserMobile user : userMobiles) {
                Message message = new Message();
                message.setSubject(inAppMessage.getSubject());
                message.setBody(inAppMessage.getBody());
                message.setUser(user);
                message.setType(inAppMessage.getType());
                if ("PRIMARY".equals(inAppMessage.getType())) {
                    message.setReceive(Byte.valueOf("1"));
                }
                messages.add(message);
                count++;
                if (count == 50 || userMobiles.size() < 50) {
                    messageRepository.save(messages);
                    messages.clear();
                }
            }
        }
    }
}

