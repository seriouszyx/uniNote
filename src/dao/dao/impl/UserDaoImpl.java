package dao.dao.impl;

import dao.UserDao;
import domain.User;
import org.apache.commons.dbutils.QueryRunner;
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
        String sql = "insert into user values (?, ?, ?, ?)";
        QueryRunner qr = new QueryRunner(JDBCUtils.getDataSource());
        Object[] params = {user.getId(), user.getUsername(), user.getPassword(), user.getEmail()};
        qr.update(sql, params);
    }
}
