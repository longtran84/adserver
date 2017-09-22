/**
 * 
 */
package com.fintechviet.quartz.jobs;

import com.fintechviet.content.service.NewsService;
import com.fintechviet.user_mobile.service.UserMobileService;
import org.quartz.Job;
import org.quartz.JobExecutionContext;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;

public class JobUserInviteWithCronTrigger implements Job {

	private static final Logger LOG = LoggerFactory.getLogger(JobUserInviteWithCronTrigger.class);

	@Autowired
	private UserMobileService userMobileService;

	@Override
	public void execute(JobExecutionContext jobExecutionContext) {
		LOG.info("Running trigger to update user invite");
		userMobileService.updateEarningForUser();
	}

}
