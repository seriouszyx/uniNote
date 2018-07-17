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

    /**
     * @Author Yixiang Zhao
     * @Description 判断用户是否已经注册且激活，为true则返回用户信息
     * @Date 10:12 2018/7/17
     * @Param [userTest]
     * @return domain.User
     **/
    User userLogin(User userTest) throws SQLException;
}
