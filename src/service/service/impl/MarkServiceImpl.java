package service.service.impl;

import dao.MarkDao;
import dao.dao.impl.MarkDaoImpl;
import domain.Mark;
import domain.Note;
import domain.User;
import service.MarkService;

import java.sql.SQLException;
import java.util.List;

/**
 * @ClassName MarkServiceImpl
 * @Description TODO
 * @Author Yixiang Zhao
 * @Date 2018/7/30 19:11
 * @Version 1.0
 */
public class MarkServiceImpl implements MarkService {

    MarkDao dao = new MarkDaoImpl();

    @Override
    public void createMark(User user, Mark mark) throws SQLException {
        dao.createMark(user, mark);
    }

    @Override
    public List<Mark> listMark(User user) throws SQLException {
        return dao.listMark(user);
    }

    @Override
    public void delMark(User user, int markID) throws SQLException {
        dao.delMark(user, markID);
    }

    @Override
    public void markTag(User user, int markID) throws SQLException {
        dao.markTag(user, markID);
    }

    @Override
    public void unMarkTag(User user, int markID) throws SQLException {
        dao.unMarkTag(user, markID);
    }

    @Override
    public List<Note> listNoteByMark(User user, int markID) throws SQLException {
        return dao.listNoteByMark(user, markID);
    }
}
