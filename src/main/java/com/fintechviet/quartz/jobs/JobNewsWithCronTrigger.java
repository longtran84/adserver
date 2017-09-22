/**
 * 
 */
package com.fintechviet.quartz.jobs;

import com.fintechviet.content.service.NewsService;
import org.quartz.*;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;

public class JobNewsWithCronTrigger implements Job {

	private static final Logger LOG = LoggerFactory.getLogger(JobNewsWithCronTrigger.class);

	@Autowired
	private NewsService newsService;

	@Override
	public void execute(JobExecutionContext jobExecutionContext) {
		LOG.info("Running trigger to get news from crawler");
		//newsService.getNewsFromCrawler();
	}

}
