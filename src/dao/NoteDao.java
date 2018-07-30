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

    /**
     * @Author Yixiang Zhao
     * @Description 根据id更新数据库中的笔记内容并修改更新时间
     * @Date 20:27 2018/7/24
     * @Param [note, noteID]
     * @return void
     **/
    void saveNote(Note note, int noteID) throws SQLException;

    /**
     * @Author Yixiang Zhao
     * @Description 在数据库中将note的isDelete属性设为1
     * @Date 20:55 2018/7/24
     * @Param [noteID]
     * @return void
     **/
    void delNote(int noteID) throws SQLException;

    /**
     * @Author Yixiang Zhao
     * @Description 根据关键字模糊搜索出笔记
     * @Date 9:40 2018/7/30
     * @Param [user, keyword]
     * @return java.util.List<domain.Note>
     **/
    List<Note> searchNote(User user, String keyword) throws SQLException;

    /**
     * @Author Yixiang Zhao
     * @Description 将数据库中对应的笔记记录isStart改为1
     * @Date 10:53 2018/7/30
     * @Param [user, noteID]
     * @return void
     **/
    void starNote(User user, int noteID) throws SQLException;
}
