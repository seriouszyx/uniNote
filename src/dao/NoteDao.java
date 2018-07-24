package dao;

import domain.Note;
import domain.Notebook;
import domain.User;

import java.sql.SQLException;
import java.util.List;

public interface NoteDao {
    /**
     * @Author Yixiang Zhao
     * @Description 向数据库添加一个新的笔记记录
     * @Date 15:35 2018/7/23
     * @Param []
     * @return void
     **/
    void createNote(User user, Note note) throws SQLException;

    /**
     * @Author Yixiang Zhao
     * @Description 根据参数查询数据库中所有笔记的记录
     * @Date 17:16 2018/7/24
     * @Param [user, notebook]
     * @return java.util.List<domain.Note>
     **/
    List<Note> listNote(User user, Notebook notebook) throws SQLException;

    /**
     * @Author Yixiang Zhao
     * @Description 根据noteID查询数据库中笔记的记录
     * @Date 17:45 2018/7/24
     * @Param [noteID]
     * @return domain.Note
     **/
    Note findContent(int noteID) throws SQLException;
}
