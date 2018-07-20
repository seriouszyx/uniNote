package service.service.impl;

import dao.NotebookDao;
import dao.dao.impl.NotebookDaoImpl;
import domain.Notebook;
import domain.User;
import service.NotebookService;

import java.sql.SQLException;

/**
 * @ClassName NotebookServiceImpl
 * @Description TODO
 * @Author Yixiang Zhao
 * @Date 2018/7/20 15:14
 * @Version 1.0
 */
public class NotebookServiceImpl implements NotebookService {

    @Override
    public Notebook createNotebook(Notebook notebook, User user) throws SQLException {
        NotebookDao dao = new NotebookDaoImpl();
        return dao.createNotebook(notebook, user);
    }
}
