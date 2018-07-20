package dao;

import domain.Notebook;
import domain.User;

import java.sql.SQLException;

public interface NotebookDao {

    /**
     * @Author Yixiang Zhao
     * @Description 在数据库notebook表中添加新的记录
     * @Date 16:07 2018/7/20
     * @Param [notebook]
     * @return domain.Notebook
     **/
    Notebook createNotebook(Notebook notebook, User user) throws SQLException;
}
