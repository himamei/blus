package com.lh.system.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class HelloControl {
    private static final Logger logger = LoggerFactory.getLogger(HelloControl.class);

    @RequestMapping("/hello")
    public String getString(){
        logger.debug("=====>测试日志debug级别打印<====");
        logger.info("=====>测试日志info级别打印<=====");
        logger.error("=====>测试日志error级别打印<====");
        logger.warn("=====>测试日志warn级别打印<=====");
        return "Hello world!";
    }
}
