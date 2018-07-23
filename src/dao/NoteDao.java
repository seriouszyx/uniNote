package dao;

import domain.Note;
import domain.User;

import java.sql.SQLException;

public interface NoteDao {
    /**
     * @Author Yixiang Zhao
     * @Description 向数据库添加一个新的笔记记录
     * @Date 15:35 2018/7/23
     * @Param []
     * @return void
     **/
    void createNote(User user, Note note) throws SQLException;
}
