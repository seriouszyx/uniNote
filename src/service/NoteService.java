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

    /**
     * @Author Yixiang Zhao
     * @Description 保存/更新笔记
     * @Date 20:26 2018/7/24
     * @Param [note, noteID]
     * @return void
     **/
    void saveNote(Note note, int noteID) throws SQLException;

    /**
     * @Author Yixiang Zhao
     * @Description 删除笔记至废纸篓
     * @Date 20:54 2018/7/24
     * @Param [noteID]
     * @return void
     **/
    void delNote(int noteID) throws SQLException;

    /**
     * @Author Yixiang Zhao
     * @Description 根据关键字查找笔记
     * @Date 9:39 2018/7/30
     * @Param [user, keyword]
     * @return java.util.List<domain.Note>
     **/
    List<Note> searchNote(User user, String keyword) throws SQLException;

    /**
     * @Author Yixiang Zhao
     * @Description 收藏笔记
     * @Date 10:52 2018/7/30
     * @Param [user, noteID]
     * @return void
     **/
    void starNote(User user, int noteID) throws SQLException;
}
