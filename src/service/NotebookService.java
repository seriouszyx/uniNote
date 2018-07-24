package service;

import domain.Notebook;
import domain.User;

import java.sql.SQLException;
import java.util.List;

public interface NotebookService {

    /**
     * @Author Yixiang Zhao
     * @Description 创建一个新的笔记本
     * @Date 16:04 2018/7/20
     * @Param [notebook]
     * @return domain.Notebook
     **/
    Notebook createNotebook(Notebook notebook, User user) throws SQLException;

    /**
     * @Author Yixiang Zhao
     * @Description 查询所有的笔记本信息
     * @Date 9:43 2018/7/24
     * @Param [user]
     * @return java.util.List<domain.Notebook>
     **/
    List<Notebook> listNotebook(User user) throws SQLException;
}
