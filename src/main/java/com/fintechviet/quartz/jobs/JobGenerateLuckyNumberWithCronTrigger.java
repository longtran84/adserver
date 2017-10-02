package com.fintechviet.quartz.jobs;

import com.fintechviet.user_mobile.service.GenerateLuckyNumberService;
import org.quartz.Job;
import org.quartz.JobExecutionContext;
import org.quartz.JobExecutionException;
import org.springframework.beans.factory.annotation.Autowired;

public class JobGenerateLuckyNumberWithCronTrigger implements Job {

    @Autowired
    private GenerateLuckyNumberService generateLuckyNumberService;

    @Override
    public void execute(JobExecutionContext jobExecutionContext) throws JobExecutionException {
        generateLuckyNumberService.generateLuckCodeForUsers();
    }
}
