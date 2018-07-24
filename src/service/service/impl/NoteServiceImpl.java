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

    NoteDao dao = new NoteDaoImpl();

    @Override
    public void createNote(User user, Note note) throws SQLException {
        dao.createNote(user, note);
    }

    @Override
    public List<Note> listNote(User user, Notebook notebook) throws SQLException {
        return dao.listNote(user, notebook);
    }

    @Override
    public Note findContent(int noteID) throws SQLException {
        return dao.findContent(noteID);
    }

    @Override
    public void saveNote(Note note, int noteID) throws SQLException {
        dao.saveNote(note, noteID);
    }

    @Override
    public void delNote(int noteID) throws SQLException {
        dao.delNote(noteID);
    }
}
