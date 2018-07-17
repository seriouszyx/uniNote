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

    @Override
    public boolean userActive(String code) throws SQLException {
        UserDao dao = new UserDaoImpl();
        User user = dao.userActive(code);
        if (null != user) {
            // 激活码匹配，激活成功
            user.setState(1);
            user.setCode(null);
            dao.updateUser(user);
            return true;
        } else {
            // 激活失败
            return false;
        }
    }

    @Override
    public User userLogin(User userTest) throws SQLException {
        UserDao dao = new UserDaoImpl();
        User uu = dao.userLogin(userTest);
        if (null == uu) {
            throw new RuntimeException("密码有误!");
        } else if (0 == uu.getState()) {
            throw new RuntimeException("用户未激活！");
        } else {
            return uu;
        }
    }


}
