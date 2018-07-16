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

    /**
     * @Author Yixiang Zhao
     * @Description 查询数据库判断是否有匹配的激活码，若有，返回用户信息
     * @Date 21:20 2018/7/16
     * @Param [code]
     * @return domain.User
     **/
    User userActive(String code) throws SQLException;

    /**
     * @Author Yixiang Zhao
     * @Description 更新数据库中的用户信息
     * @Date 21:24 2018/7/16
     * @Param [user]
     * @return void
     **/
    void updateUser(User user) throws SQLException;
}
