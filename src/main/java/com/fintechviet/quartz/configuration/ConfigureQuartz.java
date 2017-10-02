
package com.fintechviet.quartz.configuration;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;

import com.fintechviet.quartz.jobs.JobGenerateLuckyNumberWithCronTrigger;
import com.fintechviet.quartz.jobs.JobUserInviteWithCronTrigger;
import com.fintechviet.quartz.jobs.JobNewsWithCronTrigger;
import org.quartz.JobDetail;
import org.quartz.SimpleTrigger;
import org.quartz.Trigger;
import org.quartz.spi.JobFactory;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.beans.factory.config.PropertiesFactoryBean;
import org.springframework.boot.autoconfigure.condition.ConditionalOnProperty;
import org.springframework.context.ApplicationContext;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.core.io.ClassPathResource;
import org.springframework.scheduling.quartz.CronTriggerFactoryBean;
import org.springframework.scheduling.quartz.JobDetailFactoryBean;
import org.springframework.scheduling.quartz.SchedulerFactoryBean;
import org.springframework.scheduling.quartz.SimpleTriggerFactoryBean;

/**
 * @author pavan.solapure
 *
 */

@Configuration
@ConditionalOnProperty(name = "quartz.enabled")
public class ConfigureQuartz {

	//@Autowired
	//List<Trigger> listOfTrigger;

	@Bean
	public JobFactory jobFactory(ApplicationContext applicationContext) {
		AutowiringSpringBeanJobFactory jobFactory = new AutowiringSpringBeanJobFactory();
		jobFactory.setApplicationContext(applicationContext);
		return jobFactory;
	}

	@Bean
	public SchedulerFactoryBean schedulerFactoryBean(JobFactory jobFactory, Trigger jobNewsWithCronTriggerBeanTrigger, Trigger jobUserInviteWithCronTriggerBeanTrigger,
													 Trigger jobGenerateLuckyNumberWithCronTriggerBeanTrigger) throws IOException {
		SchedulerFactoryBean factory = new SchedulerFactoryBean();
		factory.setOverwriteExistingJobs(true);
		factory.setAutoStartup(true);
		//factory.setDataSource(dataSource);
		factory.setJobFactory(jobFactory);
		factory.setQuartzProperties(quartzProperties());
		List<Trigger> listOfTrigger = new ArrayList<Trigger>();
		listOfTrigger.add(jobNewsWithCronTriggerBeanTrigger);
		listOfTrigger.add(jobUserInviteWithCronTriggerBeanTrigger);
		listOfTrigger.add(jobGenerateLuckyNumberWithCronTriggerBeanTrigger);
		factory.setTriggers(listOfTrigger.toArray(new Trigger[listOfTrigger.size()]));
		return factory;
	}

	@Bean
	public Properties quartzProperties() throws IOException {
		PropertiesFactoryBean propertiesFactoryBean = new PropertiesFactoryBean();
		propertiesFactoryBean.setLocation(new ClassPathResource("/quartz.properties"));
		propertiesFactoryBean.afterPropertiesSet();
		return propertiesFactoryBean.getObject();
	}

	@Bean(name = "jobNewsWithCronTriggerBean")
	public JobDetailFactoryBean cronJobNews() {
		return createJobDetail(JobNewsWithCronTrigger.class);
	}

	@Bean(name = "jobNewsWithCronTriggerBeanTrigger")
	public CronTriggerFactoryBean cronJobNewsTrigger(@Qualifier("jobNewsWithCronTriggerBean") JobDetail jobDetail, @Value("${cron.frequency.job.news.crontrigger}") String frequency) {
		return createCronTrigger(jobDetail, frequency);
	}

	@Bean(name = "jobUserInviteWithCronTriggerBean")
	public JobDetailFactoryBean cronJobUserInvite() {
		return createJobDetail(JobUserInviteWithCronTrigger.class);
	}

	@Bean(name = "jobUserInviteWithCronTriggerBeanTrigger")
	public CronTriggerFactoryBean cronJobUserInviteTrigger(@Qualifier("jobUserInviteWithCronTriggerBean") JobDetail jobDetail, @Value("${cron.frequency.job.userinvite.crontrigger}") String frequency) {
		return createCronTrigger(jobDetail, frequency);
	}

	@Bean(name = "jobGenerateLuckyNumberWithCronTriggerBean")
	public JobDetailFactoryBean cronGenerateLuckyNumber() {
		return createJobDetail(JobGenerateLuckyNumberWithCronTrigger.class);
	}

	@Bean(name = "jobGenerateLuckyNumberWithCronTriggerBeanTrigger")
	public CronTriggerFactoryBean cronGenerateLuckyNumberTrigger(@Qualifier("jobGenerateLuckyNumberWithCronTriggerBean") JobDetail jobDetail, @Value("${cron.frequency.job.generate.luckynumber.crontrigger}") String frequency) {
		return createCronTrigger(jobDetail, frequency);
	}

	public static SimpleTriggerFactoryBean createTrigger(JobDetail jobDetail, long pollFrequencyMs) {
		SimpleTriggerFactoryBean factoryBean = new SimpleTriggerFactoryBean();
		factoryBean.setJobDetail(jobDetail);
		factoryBean.setStartDelay(0L);
		factoryBean.setRepeatInterval(pollFrequencyMs);
		factoryBean.setRepeatCount(SimpleTrigger.REPEAT_INDEFINITELY);
		// in case of misfire, ignore all missed triggers and continue :
		factoryBean.setMisfireInstruction(SimpleTrigger.MISFIRE_INSTRUCTION_RESCHEDULE_NEXT_WITH_REMAINING_COUNT);
		return factoryBean;
	}

	// Use this method for creating cron triggers instead of simple triggers:
	public static CronTriggerFactoryBean createCronTrigger(JobDetail jobDetail, String cronExpression) {
		CronTriggerFactoryBean factoryBean = new CronTriggerFactoryBean();
		factoryBean.setJobDetail(jobDetail);
		factoryBean.setCronExpression(cronExpression);
		factoryBean.setMisfireInstruction(SimpleTrigger.MISFIRE_INSTRUCTION_FIRE_NOW);
		return factoryBean;
	}

	public static JobDetailFactoryBean createJobDetail(Class jobClass) {
		JobDetailFactoryBean factoryBean = new JobDetailFactoryBean();
		factoryBean.setJobClass(jobClass);
		// job has to be durable to be stored in DB:
		factoryBean.setDurability(true);
		return factoryBean;
	}

}
