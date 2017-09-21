/**
 * 
 */
package com.fintechviet.quartz.jobs;

import com.fintechviet.content.service.NewsService;
import com.fintechviet.quartz.configuration.ConfigureQuartz;
import org.quartz.*;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Bean;
import org.springframework.scheduling.quartz.CronTriggerFactoryBean;
import org.springframework.scheduling.quartz.JobDetailFactoryBean;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Service;

public class JobWithCronTrigger implements Job {

	private static final Logger LOG = LoggerFactory.getLogger(JobWithCronTrigger.class);

	@Autowired
	private NewsService newsService;

	@Override
	public void execute(JobExecutionContext jobExecutionContext) {
		LOG.info("Running trigger to get news from crawler");
		//newsService.getNewsFromCrawler();
	}

}
