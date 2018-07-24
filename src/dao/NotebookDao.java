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
}
