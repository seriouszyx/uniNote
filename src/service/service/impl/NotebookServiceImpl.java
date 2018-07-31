package service.service.impl;

import dao.NotebookDao;
import dao.dao.impl.NotebookDaoImpl;
import domain.Notebook;
import domain.User;
import service.NotebookService;

import java.sql.SQLException;
import java.util.List;

/**
 * @ClassName NotebookServiceImpl
 * @Description TODO
 * @Author Yixiang Zhao
 * @Date 2018/7/20 15:14
 * @Version 1.0
 */
public class NotebookServiceImpl implements NotebookService {

    NotebookDao dao = new NotebookDaoImpl();

    @Override
    public Notebook createNotebook(Notebook notebook, User user) throws SQLException {

        return dao.createNotebook(notebook, user);
    }

    @Override
    public List<Notebook> listNotebook(User user) throws SQLException {
        return dao.listNotebook(user);
    }

    @Override
    public void delNotebook(User user, int notebookID) throws SQLException {
        dao.delNotebook(user, notebookID);
    }

    @Override
    public void markNotebook(User user, int notebookID) throws SQLException {
        dao.markNotebook(user, notebookID);
    }

    @Override
    public void unMarkNotebook(User user, int notebookID) throws SQLException {
        dao.unMarkNotebook(user, notebookID);
    }
}
