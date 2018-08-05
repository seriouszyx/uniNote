package dao;

import domain.Mark;
import domain.Note;
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

    /**
     * @Author Yixiang Zhao
     * @Description 将选中的标签的isDelete属性设为1
     * @Date 21:38 2018/7/30
     * @Param [user, markID]
     * @return void
     **/
    void delMark(User user, int markID) throws SQLException;

    /**
     * @Author Yixiang Zhao
     * @Description 将选中的标签的isStart设为1
     * @Date 8:32 2018/7/31
     * @Param [user, markID]
     * @return void
     **/
    void markTag(User user, int markID) throws SQLException;

    /**
     * @Author Yixiang Zhao
     * @Description 将选中的标签的isStart设为0
     * @Date 8:35 2018/7/31
     * @Param [user, markID]
     * @return void
     **/
    void unMarkTag(User user, int markID) throws SQLException;

    /**
     * @Author Yixiang Zhao
     * @Description 查找所有标记的标签
     * @Date 13:21 2018/7/31
     * @Param [user]
     * @return java.util.List<domain.Mark>
     **/
    List<Mark> listStar(User user) throws SQLException;

    /**
     * @Author Yixiang Zhao
     * @Description 根据markID查找笔记记录
     * @Date 15:14 2018/8/5
     * @Param [user, markID]
     * @return java.util.List<domain.Note>
     **/
    List<Note> listNoteByMark(User user, int markID) throws SQLException;
}
