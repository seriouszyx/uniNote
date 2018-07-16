package dao;

import domain.User;

import java.sql.SQLException;

public interface UserDao {
    /**
     * @Author Yixiang Zhao
     * @Description 向数据库添加用户信息
     * @Date 11:21 2018/7/16
     * @Param [user]
     * @return void
     **/
    void userSignup(User user) throws SQLException;
}
