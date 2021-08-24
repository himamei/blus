package com.lh.system.service.impl.service;

import com.lh.system.model.Users;
import com.lh.system.model.condition.UsersCondition;
import com.lh.system.service.IUsersService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.lh.system.dao.UsersMapper;


@Service(value = "userService")
public class UsersServiceImpl implements IUsersService {
    private static Logger logger = LoggerFactory.getLogger(UsersServiceImpl.class);


    @Autowired
    private UsersMapper usersDao;


    @Override
    public Users doLogin(UsersCondition usersCondition) {
        logger.info("this is service dologin==>" + usersCondition.getUserName());
        logger.info("this is service dologin==>" + usersCondition.getPassword());
        Users users = new Users();
        try {

            users.setUserName(usersCondition.getUserName());
            users.setPassword(usersCondition.getPassword());
            users = usersDao.selectByUserName(users);
        } catch (Exception e) {
            logger.error("登录异常！");
        }
        return users;
    }
}