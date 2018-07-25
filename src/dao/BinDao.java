package dao;

import domain.Note;
import domain.User;

import java.sql.SQLException;
import java.util.List;

public interface BinDao {

    /**
     * @Author Yixiang Zhao
     * @Description 查找note表中isDelete为1的数据
     * @Date 21:36 2018/7/24
     * @Param [user]
     * @return java.util.List<domain.Note>
     **/
    List<Note> listNoteBin(User user) throws SQLException;

    /**
     * @Author Yixiang Zhao
     * @Description 将note表中选中的笔记的isDelete设为0
     * @Date 21:42 2018/7/24
     * @Param [user]
     * @return void
     **/
    void RecoverNoteInBin(User user, int id) throws SQLException ;

    /**
     * @Author Yixiang Zhao
     * @Description 将note表中选中的笔记删除
     * @Date 21:52 2018/7/24
     * @Param [user, id]
     * @return void
     **/
    void removeNoteInBin(User user, int id) throws SQLException;

    /**
     * @Author Yixiang Zhao
     * @Description 将user用户下isDelete为1的笔记记录全部删除
     * @Date 10:18 2018/7/25
     * @Param [user]
     * @return void
     **/
    void clearNoteInBin(User user) throws SQLException;
}
