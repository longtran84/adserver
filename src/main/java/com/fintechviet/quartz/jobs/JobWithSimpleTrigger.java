/**
 * 
 */
package com.fintechviet.quartz.jobs;

import com.fintechviet.quartz.configuration.ConfigureQuartz;
import org.quartz.DisallowConcurrentExecution;
import org.quartz.Job;
import org.quartz.JobDetail;
import org.quartz.JobExecutionContext;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Bean;
import org.springframework.scheduling.quartz.JobDetailFactoryBean;
import org.springframework.scheduling.quartz.SimpleTriggerFactoryBean;
import org.springframework.stereotype.Component;

/**
 * @author pavan.solapure
 *
 */
@Component
@DisallowConcurrentExecution
public class JobWithSimpleTrigger implements Job {

	private static final Logger LOG = LoggerFactory.getLogger(JobWithSimpleTrigger.class);
	
	@Value("${cron.frequency.jobwithsimpletrigger}")
    private long frequency;

	@Override
	public void execute(JobExecutionContext jobExecutionContext) {
		LOG.info("Running JobWithSimpleTrigger | frequency {}", frequency);
	}
	
	@Bean(name = "jobWithSimpleTriggerBean")
    public JobDetailFactoryBean sampleJob() {
        return ConfigureQuartz.createJobDetail(this.getClass());
    }

    @Bean(name = "jobWithSimpleTriggerBeanTrigger")
    public SimpleTriggerFactoryBean sampleJobTrigger(@Qualifier("jobWithSimpleTriggerBean") JobDetail jobDetail) {
    	return ConfigureQuartz.createTrigger(jobDetail,frequency);
    }
}
