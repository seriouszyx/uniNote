package service;

import domain.User;

import java.sql.SQLException;
import java.util.List;

public interface StarService {

    /**
     * @Author Yixiang Zhao
     * @Description 查找所有快捷方式
     * @Date 13:13 2018/7/31
     * @Param [user]
     * @return java.util.List<java.lang.Object>
     **/
    List<Object> listStar(User user) throws SQLException;
}
