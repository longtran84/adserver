package com.fintechviet.user_mobile.service;

import com.fintechviet.user_mobile.model.UserMobile;
import com.fintechviet.user_mobile.model.UserMobileLuckyNumber;
import com.fintechviet.user_mobile.repository.UserMobileLuckyNumberRepository;
import com.fintechviet.user_mobile.repository.UserMobileRepository;
import com.fintechviet.utils.DateUtils;
import io.vavr.Tuple2;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.*;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;

@Service
public class GenerateLuckyNumberServiceImpl implements GenerateLuckyNumberService {

    private int BATCH_SIZE = 100;

    @Autowired
    private UserMobileRepository userMobileRepository;

    @Autowired
    private UserMobileLuckyNumberRepository userMobileLuckyNumberRepository;

    @Override
    public void generateLuckCodeForUsers() {
        List<UserMobile> users = userMobileRepository.findAll();
        if (users == null || users.isEmpty()) {
            return;
        }

        int totalUsers = users.size();
        List<List<UserMobile>> batches = new ArrayList<>();

        if (totalUsers / BATCH_SIZE == 0) {
            batches.add(users);
        } else {
            for (int i = 0; i < totalUsers / BATCH_SIZE; i++) {
                if (i == (totalUsers / BATCH_SIZE) - 1) {
                    batches.add(users.subList(i * BATCH_SIZE, totalUsers));
                } else {
                    batches.add(users.subList(i * BATCH_SIZE, (i + 1) * BATCH_SIZE));
                }
            }
        }
        ExecutorService executorService = Executors.newFixedThreadPool(10);
        batches.stream().forEach(e -> {
            executorService.execute(new InsertThread(e, System.currentTimeMillis()));
        });
        executorService.shutdown();
    }

    private class InsertThread implements Runnable {

        private List<UserMobile> userMobiles;
        private long begin;

        public InsertThread(List<UserMobile> userMobiles, long begin) {
            this.userMobiles = userMobiles;
            this.begin = begin;
        }

        @Override
        public void run() {
            List<UserMobileLuckyNumber> listToSave = new ArrayList<>();
            Tuple2<Date, Date> weekInterval = DateUtils.getCurrentWeekInterval();
            userMobiles.stream().forEach(e -> {
                UserMobileLuckyNumber userMobileLuckyNumber = new UserMobileLuckyNumber();
                userMobileLuckyNumber.setUserMobileId(e.getId());
                userMobileLuckyNumber.setLuckyNumber(generateLuckyNumber());
                userMobileLuckyNumber.setStartDateWeek(weekInterval._1);
                userMobileLuckyNumber.setEndDateWeek(weekInterval._2);
                userMobileLuckyNumber.setStatus("INVALID");
                userMobileLuckyNumber.setCreateDate(Calendar.getInstance().getTime());

                listToSave.add(userMobileLuckyNumber);
            });
            userMobileLuckyNumberRepository.save(listToSave);
        }

        private int generateLuckyNumber() {

            StringBuilder randomNumString = new StringBuilder();

            Random r = new Random();

            //Generate the first digit from 1-9
            randomNumString.append(r.nextInt(9) + 1);

            //Generate the remaining digits between 0-9
            for (int x = 1; x < 6; x++) {
                randomNumString.append(r.nextInt(10));
            }
            //Parse and return
            return Integer.parseInt(randomNumString.toString());
        }
    }
}
