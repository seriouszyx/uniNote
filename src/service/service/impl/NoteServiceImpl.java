package service.service.impl;

import dao.NoteDao;
import dao.dao.impl.NoteDaoImpl;
import domain.Note;
import domain.Notebook;
import domain.User;
import service.NoteService;

import java.sql.SQLException;
import java.util.List;

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

    @Override
    public List<Note> listNote(User user, Notebook notebook) throws SQLException {
        NoteDao dao = new NoteDaoImpl();
        return dao.listNote(user, notebook);
    }

    @Override
    public Note findContent(int noteID) throws SQLException {
        NoteDao dao = new NoteDaoImpl();
        return dao.findContent(noteID);
    }
}
