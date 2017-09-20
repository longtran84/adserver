/**
 * 
 */
package com.fintechviet.quartz.jobs;

import com.fintechviet.quartz.configuration.ConfigureQuartz;
import org.quartz.DisallowConcurrentExecution;
import org.quartz.Job;
import org.quartz.JobDataMap;
import org.quartz.JobDetail;
import org.quartz.JobExecutionContext;
import org.quartz.JobExecutionException;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Bean;
import org.springframework.scheduling.quartz.CronTriggerFactoryBean;
import org.springframework.scheduling.quartz.JobDetailFactoryBean;
import org.springframework.stereotype.Component;


/**
 * @author pavan.solapure
 *
 */
@Component
@DisallowConcurrentExecution
public class JobWithDataMap implements Job {
	private static final Logger LOG = LoggerFactory.getLogger(JobWithDataMap.class);
	
	@Value("${cron.frequency.jobwithdatamap}")
    private String frequency;
	
	JobDataMap jMap = new JobDataMap();

	@Override
	public void execute(JobExecutionContext jobContext) throws JobExecutionException {
		LOG.info("Running JobWithDataMap | frequency {}", frequency);
		JobDataMap dataMap = jobContext.getJobDetail().getJobDataMap();
		String key1 = dataMap.get("key1").toString();
		String key2 = dataMap.get("key2").toString();
		LOG.info("Running JobWithDataMap | Key1 = {}, Key2 = {}", key1, key2 );
	}
	
	@Bean(name = "jobWithDataMapBean")
    public JobDetailFactoryBean sampleJob() {
		JobDetailFactoryBean jBean = ConfigureQuartz.createJobDetail(this.getClass());
		jMap.put("key1", "value1");
		jMap.put("key2", "value2");
		jBean.setJobDataMap(jMap);
        return jBean;
    }

    @Bean(name = "jobWithDataMapTrigger")
    public CronTriggerFactoryBean sampleJobTrigger(@Qualifier("jobWithDataMapBean") JobDetail jobDetail) {
    	return ConfigureQuartz.createCronTrigger(jobDetail,frequency);
    }

}
