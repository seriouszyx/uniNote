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

    /**
     * @Author Yixiang Zhao
     * @Description 将标签移入废纸篓
     * @Date 21:37 2018/7/30
     * @Param [user, markID]
     * @return void
     **/
    void delMark(User user, int markID) throws SQLException;

    /**
     * @Author Yixiang Zhao
     * @Description 收藏标签
     * @Date 8:31 2018/7/31
     * @Param [user, markID]
     * @return void
     **/
    void markTag(User user, int markID) throws SQLException;

    /**
     * @Author Yixiang Zhao
     * @Description 标签移除收藏
     * @Date 8:34 2018/7/31
     * @Param [user, markID]
     * @return void
     **/
    void unMarkTag(User user, int markID) throws SQLException;
}
