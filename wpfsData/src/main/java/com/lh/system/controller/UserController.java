package com.lh.system.controller;

import com.lh.system.model.Users;
import com.lh.system.model.condition.UsersCondition;
import com.lh.system.service.IUsersService;
import com.lh.util.Md5Util;
import com.lh.util.excel.ExcelConstant;
import com.lh.util.excel.ExcelData;
import com.lh.util.excel.ExcelUtils;
import com.lh.util.result.BizException;
import com.lh.util.result.CommonEnum;
import com.lh.util.result.ResultUtil;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.util.List;

@RestController
@RequestMapping(value = {"/user"})
public class UserController {
    private static final Logger logger = LoggerFactory.getLogger(UserController.class);


    @Autowired
    private IUsersService userService;

    @RequestMapping(value = "login.do")
    public ResultUtil login(String userName, String password, HttpServletRequest request) {
        logger.info("login ing~~~~~~~~~~~~~~~");
        logger.info("login username is ==>" + userName);
        String responceMes = "";
        Users users = null;
        try {
            if (userName == null || "".equals(userName)) {
                logger.warn("userName===参数为空！");
                return new ResultUtil().error("22", "登录名不能为空");

            }
            if (password == null || "".equals(password)) {
                logger.warn("password===参数为空！");
                return new ResultUtil().error("11", "密码不能为空");
            }

            logger.info("加密前==>" + password);
            String pwds = Md5Util.string2MD5(password);
            logger.info("加密后==>" + pwds);

            UsersCondition usersCondition = new UsersCondition();
            usersCondition.setUserName(userName);
            usersCondition.setPassword(pwds);

            users = userService.doLogin(usersCondition);

            if (users == null) {
                logger.info("用户名或密码错误，或没有查到该用户信息！");
                throw new BizException("-1", "数据查询失败！");
            }
            responceMes = users.getRealName() + ",登录成功！";
        } catch (Exception e) {
            logger.error("登录异常！", e);
        }
        return new ResultUtil().success(users);
    }


    @PostMapping(value = "/logins")
    public ResultUtil login1(@RequestParam("userName") String userName, @RequestParam("password") String password, HttpServletResponse response, HttpServletRequest request) throws Exception {
        if (userName == null || "".equals(userName)) {
            logger.warn("userName===参数为空！");
            return new ResultUtil().error(CommonEnum.USERNAME_ISNULL.getResultCode(), CommonEnum.USERNAME_ISNULL.getResultMsg());

        }
        if (password == null || "".equals(password)) {
            logger.warn("password===参数为空！");
            return new ResultUtil().error(CommonEnum.PASSWORD_ISNULL.getResultCode(), CommonEnum.PASSWORD_ISNULL.getResultMsg());
        }


        String pwds = Md5Util.string2MD5(password);
        UsersCondition usersCondition = new UsersCondition();
        usersCondition.setUserName(userName);
        usersCondition.setPassword(pwds);
        logger.info("用户名和密码分别是==>" + userName + "||" + pwds);
        Users users = null;
        users = userService.doLogin(usersCondition);
        response.setContentType("text/html;charset=utf-8");
        response.setCharacterEncoding("utf-8");
        if (users != null && !"".equals(users)) {
            request.getSession().setAttribute("userName", users.getUserName());//用户名存入该用户的session 中
            request.getSession().setAttribute("realName", users.getRealName());//用户名存入该用户的session 中
            return new ResultUtil().success(users);
        } else {
            return new ResultUtil().error("11", "登录失败！");
        }
    }

    @PostMapping(value = "/getUserInfo")
    public ResultUtil getUserInfoBySession(HttpServletRequest request) {
        String userName = request.getSession().getAttribute("userName").toString();
        String realName = request.getSession().getAttribute("realName").toString();
        Users users = new Users();
        users.setUserName(userName);
        users.setRealName(realName);
        logger.info("从session中获取的值分别为：" + userName + "||" + realName);
        return new ResultUtil().success(users);

    }

    @RequestMapping("/excel")
    public void test2(HttpServletResponse response, @RequestParam("userName") String userName, @RequestParam("password") String password) {
        int rowIndex = 0;

        Users users = new Users();
        String pwds = Md5Util.string2MD5(password);
        UsersCondition usersCondition = new UsersCondition();
        usersCondition.setUserName(userName);
        usersCondition.setPassword(pwds);

        users = userService.doLogin(usersCondition);
        ExcelData data = new ExcelData();
//        data.setName("hello");
        List<String> titles = new ArrayList();
        titles.add("ID");
        titles.add("用户名");
        titles.add("密码");
        titles.add("姓名");
        titles.add("创建日期");
        data.setTitles(titles);

        List<List<Object>> rows = new ArrayList();
        List<Object> row = new ArrayList();
        row.add(users.getId());
        row.add(users.getUserName());
        row.add(users.getPassword());
        row.add(users.getRealName());
        row.add(users.getCreateTime());

        List<Object> row2= new ArrayList();
        row2.add("2");
        row2.add("test");
        row2.add("123");
        row2.add("测试");
        row2.add("2021-07-24");

        rows.add(row);
        rows.add(row2);
        data.setRows(rows);
        try {
            ExcelUtils.generateExcel(data, ExcelConstant.FILE_PATH + new ExcelConstant().getFileName("userInfo"));
        } catch (Exception e) {
            e.printStackTrace();
        }
    }


}