package com.lh.system.controller;

import com.lh.system.model.Users;
import com.lh.system.model.condition.UsersCondition;
import com.lh.system.service.IUsersService;
import com.lh.util.Md5Util;
import org.apache.commons.lang.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.context.SecurityContext;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

/**
 * @author DT
 * @version 1.0
 * @description: TODOS
 * @date 2021/7/23 16:34
 */
@RestController
@RequestMapping(value = {"/login"})
public class LoginController {
    private static final Logger logger = LoggerFactory.getLogger(LoginController.class);

    @Autowired
    private IUsersService userService;

//    @RequestMapping (value="/index")
//    public String index(HttpServletRequest request){
//        logger.info("this is index function!");
////        return "frameset/main";
//        return "html/hello";
//
//    }


}
