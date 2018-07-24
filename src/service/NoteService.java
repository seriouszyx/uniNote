package service;

import domain.Note;
import domain.User;

import java.sql.SQLException;

public interface NoteService {

    /**
     * @Author Yixiang Zhao
     * @Description 创建新的笔记
     * @Date 15:33 2018/7/23
     * @Param []
     * @return void
     **/
    void createNote(User user, Note note)throws SQLException;
}
