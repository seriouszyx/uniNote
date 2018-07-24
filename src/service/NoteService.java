package service;

import domain.Note;
import domain.Notebook;
import domain.User;

import java.sql.SQLException;
import java.util.List;

public interface NoteService {

    /**
     * @Author Yixiang Zhao
     * @Description 创建新的笔记
     * @Date 15:33 2018/7/23
     * @Param []
     * @return void
     **/
    void createNote(User user, Note note)throws SQLException;

    /**
     * @Author Yixiang Zhao
     * @Description 根据userid和notebookid查询所有的笔记
     * @Date 17:14 2018/7/24
     * @Param [user, notebook]
     * @return java.util.List<domain.Note>
     **/
    List<Note> listNote(User user, Notebook notebook) throws SQLException;

    /**
     * @Author Yixiang Zhao
     * @Description 根据noteID查找笔记内容
     * @Date 17:44 2018/7/24
     * @Param [noteID]
     * @return domain.Note
     **/
    Note findContent(int noteID) throws SQLException;
}
