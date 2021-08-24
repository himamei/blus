package com.lh.util.quartz;

import org.quartz.SchedulerException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.scheduling.annotation.EnableScheduling;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

/**
 * 定时触发任务
 */
@Configuration
@EnableScheduling
@Component
public class SchedulerListener {

    @Autowired
    public CronSchedulerJob scheduleJobs;

    /**
     * 设置某一时间开始执行定时任务
     * @throws SchedulerException
     */
    @Scheduled(cron="0 11 11 ? * *")
    public void schedule() throws SchedulerException {
        scheduleJobs.scheduleJobs();
        System.out.println(">>>>>>>>>>>>>>>定时任务开始执行<<<<<<<<<<<<<");
    }

}