package dao;

import domain.Mark;
import domain.User;

import java.sql.SQLException;
import java.util.List;

public interface MarkDao {

    /**
     * @Author Yixiang Zhao
     * @Description 项数据库mark表中添加记录
     * @Date 19:16 2018/7/30
     * @Param [user, markName]
     * @return void
     **/
    void createMark(User user, Mark mark) throws SQLException;

    /**
     * @Author Yixiang Zhao
     * @Description 查找所有的标签
     * @Date 19:34 2018/7/30
     * @Param [user]
     * @return java.util.List<domain.Mark>
     **/
    List<Mark> listMark(User user) throws SQLException;
}
