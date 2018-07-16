package service;

import domain.User;

import java.sql.SQLException;

public interface UserService {
    /**
     * @Author Yixiang Zhao
     * @Description 向数据库添加用户信息
     * @Date 11:26 2018/7/16
     * @Param [user]
     * @return void
     **/
    void userSignup(User user) throws SQLException;

    /**
     * @Author Yixiang Zhao
     * @Description 判断用户是否已注册
     * @Date 21:21 2018/7/16
     * @Param [code]
     * @return boolean
     **/
    boolean userActive(String code) throws SQLException;
}
