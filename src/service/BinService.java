package service;

import domain.Note;
import domain.Notebook;
import domain.User;

import java.sql.SQLException;
import java.util.List;

public interface BinService {

    /**
     * @Author Yixiang Zhao
     * @Description 找到所有删除但是未移除的笔记
     * @Date 21:33 2018/7/24
     * @Param [user]
     * @return java.util.List<domain.Note>
     **/
    List<Note> listNoteInBin(User user) throws SQLException;

    /**
     * @Author Yixiang Zhao
     * @Description 将废纸篓中的笔记还原
     * @Date 21:41 2018/7/24
     * @Param [user]
     * @return void
     **/
    void RecoverNoteInBin(User user, int id) throws SQLException;

    /**
     * @Author Yixiang Zhao
     * @Description 将废纸篓中的笔记移除
     * @Date 21:51 2018/7/24
     * @Param [user, id]
     * @return void
     **/
    void removeNoteInBin(User user, int id) throws SQLException;

    /**
     * @Author Yixiang Zhao
     * @Description 清空废纸篓中的笔记
     * @Date 10:17 2018/7/25
     * @Param [user]
     * @return void
     **/
    void clearNoteInBin(User user) throws SQLException;

    /**
     * @Author Yixiang Zhao
     * @Description 找到所有删除但是未移除的笔记本
     * @Date 15:26 2018/7/30
     * @Param [user]
     * @return java.util.List<domain.Notebook>
     **/
    List<Notebook> listNotebookInBin(User user) throws SQLException;

    /**
     * @Author Yixiang Zhao
     * @Description 将废纸篓中的笔记本移除
     * @Date 15:44 2018/7/30
     * @Param [user, id]
     * @return void
     **/
    void removeNotebookInBin(User user, int id) throws SQLException;

    /**
     * @Author Yixiang Zhao
     * @Description 将废纸篓中的笔记本还原
     * @Date 16:03 2018/7/30
     * @Param [user, id]
     * @return void
     **/
    void RecoverNotebookInBin(User user, int id) throws SQLException;
}
