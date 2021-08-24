package com.lh.util.quartz;

import com.lh.system.controller.UserController;
import org.quartz.Job;
import org.quartz.JobExecutionContext;
import org.quartz.JobExecutionException;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * 某一个定时任务
 * @author mamei
 * @Date 20210721
 */
public class ScheduledJob implements Job {

    private String name;

    public void setName(String name) {
        this.name = name;
    }

    private static final Logger logger = LoggerFactory.getLogger(UserController.class);

    @Override
    public void execute(JobExecutionContext jobExecutionContext) throws JobExecutionException {

        SimpleDateFormat dateFormat = new SimpleDateFormat("HH:mm:ss");

        System.out.println("CRON ----> schedule job1 is running ... + " + name + "  ---->  " + dateFormat.format(new Date()));
    }
}