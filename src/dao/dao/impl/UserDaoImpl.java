package dao.dao.impl;

import dao.UserDao;
import domain.User;
import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;
import utils.JDBCUtils;

import java.sql.SQLException;

/**
 * @ClassName UserDaoImpl
 * @Description 处理User对数据库的相关操作
 * @Author Yixiang Zhao
 * @Date 2018/7/15 18:19
 * @Version 1.0
 */
public class UserDaoImpl implements UserDao {
    @Override
    public void userSignup(User user) throws SQLException {
        String sql = "insert into user values (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
        QueryRunner qr = new QueryRunner(JDBCUtils.getDataSource());
        Object[] params = {user.getId(), user.getUsername(), user.getPassword(), user.getEmail(),
                            user.getCode(), user.getName(), user.getTelephone(), user.getSex(),
                            user.getState(), user.getCreateTime()};
        qr.update(sql, params);
    }

    @Override
    public User userActive(String code) throws SQLException {
        String sql = "select * from user where code = ?";
        QueryRunner qr = new QueryRunner(JDBCUtils.getDataSource());
        return qr.query(sql, new BeanHandler<User>(User.class), code);
    }

    @Override
    public void updateUser(User user) throws SQLException {
        String sql = "update user set username = ?, password = ?, email = ?," +
                "code = ?, name = ?, telephone = ?, sex = ?, state = ?, createTime = ? where id = ?";
        QueryRunner qr = new QueryRunner(JDBCUtils.getDataSource());
        Object[] params = {user.getUsername(), user.getPassword(), user.getEmail(),
                user.getCode(), user.getName(), user.getTelephone(), user.getSex(),
                user.getState(), user.getCreateTime(), user.getId()};
        qr.update(sql, params);
    }

    @Override
    public User userLogin(User userTest) throws SQLException {
        String sql = "select * from user where username = ? and password = ?";
        QueryRunner qr = new QueryRunner(JDBCUtils.getDataSource());
        return qr.query(sql, new BeanHandler<User>(User.class), userTest.getUsername(), userTest.getPassword());
    }


}
