package dao;

import domain.Notebook;
import domain.User;

import java.sql.SQLException;
import java.util.List;

public interface NotebookDao {

    /**
     * @Author Yixiang Zhao
     * @Description 在数据库notebook表中添加新的记录
     * @Date 16:07 2018/7/20
     * @Param [notebook]
     * @return domain.Notebook
     **/
    Notebook createNotebook(Notebook notebook, User user) throws SQLException;

    /**
     * @Author Yixiang Zhao
     * @Description 在数据库中查询所有笔记本信息并返回集合
     * @Date 9:44 2018/7/24
     * @Param [user]
     * @return java.util.List<domain.Notebook>
     **/
    List<Notebook> listNotebook(User user) throws SQLException;

    /**
     * @Author Yixiang Zhao
     * @Description 根据条件将笔记本的isdelete属性改为1
     * @Date 15:02 2018/7/30
     * @Param [user, notebookID]
     * @return void
     **/
    void delNotebook(User user, int notebookID) throws SQLException;

    /**
     * @Author Yixiang Zhao
     * @Description 将选中笔记本的isStart属性设为1
     * @Date 16:19 2018/7/30
     * @Param [user, notebookID]
     * @return void
     **/
    void markNotebook(User user, int notebookID) throws SQLException;

    /**
     * @Author Yixiang Zhao
     * @Description 将选中的笔记本的isStart属性设为0
     * @Date 16:46 2018/7/30
     * @Param [user, notebookID]
     * @return void
     **/
    void unMarkNotebook(User user, int notebookID) throws SQLException;
}
