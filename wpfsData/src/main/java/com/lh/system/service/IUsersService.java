package com.lh.system.service;

import com.lh.system.model.Users;
import com.lh.system.model.condition.UsersCondition;

public interface IUsersService {

    Users doLogin(UsersCondition usersCondition);


}
