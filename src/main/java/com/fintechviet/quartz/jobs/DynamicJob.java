/**
 * 
 */
package com.fintechviet.quartz.jobs;

import org.quartz.DisallowConcurrentExecution;
import org.quartz.Job;
import org.quartz.JobExecutionContext;
import org.quartz.JobExecutionException;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

@DisallowConcurrentExecution
public class DynamicJob  implements Job {

	private static final Logger LOG = LoggerFactory.getLogger(DynamicJob.class);
	
	@Override
	public void execute(JobExecutionContext arg0) throws JobExecutionException {
		LOG.info("----- Running Dynamic Job With Simple Trigger ------");
	}

}
