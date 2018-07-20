package service;

import domain.Notebook;
import domain.User;

import java.sql.SQLException;

public interface NotebookService {

    /**
     * @Author Yixiang Zhao
     * @Description 创建一个新的笔记本
     * @Date 16:04 2018/7/20
     * @Param [notebook]
     * @return domain.Notebook
     **/
    Notebook createNotebook(Notebook notebook, User user) throws SQLException;
}
