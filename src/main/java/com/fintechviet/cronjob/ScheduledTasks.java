package com.fintechviet.cronjob;

import com.fintechviet.ads.model.Ad;
import com.fintechviet.ads.service.AdService;
import com.fintechviet.ads.web.PushAdsHelper;
import com.fintechviet.user_mobile.service.GenerateLuckyNumberService;
import com.fintechviet.user_mobile.service.UserMobileService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import java.io.IOException;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.List;
import java.util.Random;

/**
 * Created by tungn on 4/9/2018.
 */
@Component
public class ScheduledTasks {
    @Autowired
    private GenerateLuckyNumberService generateLuckyNumberService;
    @Autowired
    private UserMobileService userMobileService;
    @Autowired
    private AdService adService;

    private static final Logger LOG = LoggerFactory.getLogger(ScheduledTasks.class);
    private static final DateTimeFormatter dateTimeFormatter = DateTimeFormatter.ofPattern("HH:mm:ss");

    @Scheduled(cron = "0 0 1 ? * MON")
    public void generateLuckyNumber() {
        LOG.info("Generate Lucky number task :: Execution Time - "+  dateTimeFormatter.format(LocalDateTime.now()));
        generateLuckyNumberService.generateLuckCodeForUsers();
    }

    @Scheduled(cron = "0 0/30 * * * ?")
    public void updateRewardForUserInvite() {
        LOG.info("Update reward for user invite task :: Execution Time - "+  dateTimeFormatter.format(LocalDateTime.now()));
        userMobileService.updateEarningForUser();
    }

    @Scheduled(cron = "0 0/5 * * * ?")
    public void pushAdvNotification() {
        LOG.info("Push adv notification task :: Execution Time - "+  dateTimeFormatter.format(LocalDateTime.now()));
        List<Ad> ads = adService.findActiveAdvs();
        if (ads.size() > 0) {
            Random rd = new Random();
            int index = rd.nextInt(ads.size() - 1);
            Ad ad = ads.get(index);
            try {
                PushAdsHelper.sendPushAds(ad);
            } catch (IOException ex) {
                LOG.error("Push adv notification error: " + ex);
            }
        }

    }
}
