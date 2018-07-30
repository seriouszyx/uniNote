package service.service.impl;

import dao.BinDao;
import dao.dao.impl.BinDaoImpl;
import domain.Note;
import domain.Notebook;
import domain.User;
import service.BinService;

import java.sql.SQLException;
import java.util.List;

/**
 * @ClassName BinServiceImpl
 * @Description BinService的实现类
 * @Author Yixiang Zhao
 * @Date 2018/7/24 21:26
 * @Version 1.0
 */
public class BinServiceImpl implements BinService {
    BinDao dao = new BinDaoImpl();

    @Override
    public List<Note> listNoteInBin(User user) throws SQLException {
        return dao.listNoteBin(user);
    }

    @Override
    public void RecoverNoteInBin(User user, int id) throws SQLException {
        dao.RecoverNoteInBin(user, id);
    }

    @Override
    public void removeNoteInBin(User user, int id) throws SQLException {
        dao.removeNoteInBin(user, id);
    }

    @Override
    public void clearNoteInBin(User user) throws SQLException {
        dao.clearNoteInBin(user);
    }

    @Override
    public List<Notebook> listNotebookInBin(User user) throws SQLException {
        return dao.listNotebookInBin(user);
    }

    @Override
    public void removeNotebookInBin(User user, int id) throws SQLException {
        dao.removeNotebookInBin(user, id);
    }

    @Override
    public void RecoverNotebookInBin(User user, int id) throws SQLException {
        dao.RecoverNotebookInBin(user, id);
    }
}
