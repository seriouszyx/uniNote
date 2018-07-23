package service.service.impl;

import dao.NoteDao;
import dao.dao.impl.NoteDaoImpl;
import domain.Note;
import domain.User;
import service.NoteService;

import java.sql.SQLException;

/**
 * @ClassName NoteServiceImpl
 * @Description NoteService的实现
 * @Author Yixiang Zhao
 * @Date 2018/7/23 15:28
 * @Version 1.0
 */
public class NoteServiceImpl implements NoteService {

    @Override
    public void createNote(User user, Note note) throws SQLException {
        NoteDao dao = new NoteDaoImpl();
        dao.createNote(user, note);
    }
}
