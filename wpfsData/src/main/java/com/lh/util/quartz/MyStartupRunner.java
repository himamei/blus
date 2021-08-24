package com.lh.util.quartz;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.CommandLineRunner;
import org.springframework.stereotype.Component;

/**
 * 项目启动时执行任务
 * @author mamei
 * @Date 20210721
 */
@Component
public class MyStartupRunner implements CommandLineRunner {

    @Autowired
    public CronSchedulerJob scheduleJobs;

    @Override
    public void run(String... args) throws Exception {
//        scheduleJobs.scheduleJobs();
//        System.out.println(">>>>>>>>>>>>>>>MyStartupRunner定时任务开始执行<<<<<<<<<<<<<");
    }
}