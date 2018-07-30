package service;

import domain.Mark;
import domain.User;

import java.sql.SQLException;
import java.util.List;

public interface MarkService {

    /**
     * @Author Yixiang Zhao
     * @Description 创建标签
     * @Date 19:14 2018/7/30
     * @Param [user, markName]
     * @return void
     **/
    void createMark(User user, Mark mark) throws SQLException;

    /**
     * @Author Yixiang Zhao
     * @Description 查找所有的标签
     * @Date 19:33 2018/7/30
     * @Param [user]
     * @return java.util.List<domain.Mark>
     **/
    List<Mark> listMark(User user) throws SQLException;
}
