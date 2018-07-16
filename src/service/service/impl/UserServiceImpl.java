package service.service.impl;

import dao.UserDao;
import dao.dao.impl.UserDaoImpl;
import domain.User;
import service.UserService;

import java.sql.SQLException;

/**
 * @ClassName UserServiceImpl
 * @Description 处理User的相关操作
 * @Author Yixiang Zhao
 * @Date 2018/7/15 18:21
 * @Version 1.0
 */
public class UserServiceImpl implements UserService {
    @Override
    public void userSignup(User user) throws SQLException {
        UserDao dao = new UserDaoImpl();
        dao.userSignup(user);
    }
}
