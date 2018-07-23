package dao.dao.impl;

import dao.NoteDao;
import domain.Note;
import domain.User;
import org.apache.commons.dbutils.QueryRunner;
import utils.JDBCUtils;

import java.sql.SQLException;

/**
 * @ClassName NoteDaoImpl
 * @Description TODO
 * @Author Yixiang Zhao
 * @Date 2018/7/23 15:29
 * @Version 1.0
 */
public class NoteDaoImpl implements NoteDao {
    @Override
    public void createNote(User user, Note note) throws SQLException {
        String sql = "insert into note values (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
        Object[] params = {note.getId(), user.getId(), note.getContent(), note.getCreateTime(),
                            note.getUpdateTime(), note.getMarkID(), note.getNotebookID(), note.getRemindTime(),
                            note.getIsStart(), note.getIsShare(), note.getIsdelete(), note.getSharedpeople()};
        QueryRunner qr = new QueryRunner(JDBCUtils.getDataSource());
        qr.update(sql, params);
    }
}
