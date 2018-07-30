package dao.dao.impl;

import dao.BinDao;
import domain.Note;
import domain.Notebook;
import domain.User;
import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanListHandler;
import utils.JDBCUtils;

import java.sql.SQLException;
import java.util.List;

/**
 * @ClassName BinDaoImpl
 * @Description TODO
 * @Author Yixiang Zhao
 * @Date 2018/7/24 21:35
 * @Version 1.0
 */
public class BinDaoImpl implements BinDao {
    @Override
    public List<Note> listNoteBin(User user) throws SQLException {
        String sql = "select * from note where isDelete = 1 and userid = ?";
        QueryRunner qr = new QueryRunner(JDBCUtils.getDataSource());
        return qr.query(sql, new BeanListHandler<Note>(Note.class), user.getId());
    }

    @Override
    public void RecoverNoteInBin(User user, int id) throws SQLException {
        String sql = "update note set isDelete = 0 where userid = ? and id = ?";
        QueryRunner qr = new QueryRunner(JDBCUtils.getDataSource());
        qr.update(sql, user.getId(), id);
    }

    @Override
    public void removeNoteInBin(User user, int id) throws SQLException {
        String sql = "delete from note where id = ? and userid = ?";
        QueryRunner qr = new QueryRunner(JDBCUtils.getDataSource());
        qr.update(sql, id, user.getId());
    }

    @Override
    public void clearNoteInBin(User user) throws SQLException {
        String sql = "delete from note where userid = ? and isDelete = 1";
        QueryRunner qr = new QueryRunner(JDBCUtils.getDataSource());
        qr.update(sql, user.getId());
    }

    @Override
    public List<Notebook> listNotebookInBin(User user) throws SQLException {
        String sql = "select * from notebook where isDelete = 1 and userid = ?";
        QueryRunner qr = new QueryRunner(JDBCUtils.getDataSource());
        return qr.query(sql, new BeanListHandler<Notebook>(Notebook.class), user.getId());
    }

    @Override
    public void removeNotebookInBin(User user, int id) throws SQLException {
        String sql = "delete from notebook where userid = ? and isDelete = 1";
        QueryRunner qr = new QueryRunner(JDBCUtils.getDataSource());
        qr.update(sql, user.getId());
    }

    @Override
    public void RecoverNotebookInBin(User user, int id) throws SQLException {
        String sql = "update notebook set isDelete = 0 where userid = ? and id = ?";
        QueryRunner qr = new QueryRunner(JDBCUtils.getDataSource());
        qr.update(sql, user.getId(), id);
    }
}
