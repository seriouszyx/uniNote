package dao.dao.impl;

import dao.NotebookDao;
import domain.Notebook;
import domain.User;
import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;
import utils.JDBCUtils;

import java.sql.SQLException;
import java.util.List;

/**
 * @ClassName NotebookDaoImpl
 * @Description TODO
 * @Author Yixiang Zhao
 * @Date 2018/7/20 16:04
 * @Version 1.0
 */
public class NotebookDaoImpl implements NotebookDao {

    @Override
    public Notebook createNotebook(Notebook notebook, User user) throws SQLException {
        String sql = "insert into notebook values (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
        QueryRunner qr = new QueryRunner(JDBCUtils.getDataSource());
        Object[] params = {notebook.getId(), user.getId(), notebook.getBookName(),
                            notebook.getIsShare(), notebook.getIsDelete(), notebook.getCreateTime(),
                            notebook.getUpdateTime(), notebook.getIsStart(), notebook.getNoteNumber(),
                            notebook.getSharedpeople()};
        qr.update(sql, params);
        return notebook;
    }

    @Override
    public List<Notebook> listNotebook(User user) throws SQLException {
        String sql = "select * from notebook where userid = ? and isDelete = 0";
        QueryRunner qr = new QueryRunner(JDBCUtils.getDataSource());
        return qr.query(sql, new BeanListHandler<Notebook>(Notebook.class), user.getId());
    }

    @Override
    public void delNotebook(User user, int notebookID) throws SQLException {
        String sql = "update notebook set isDelete = 1 where userid = ? and id = ?";
        QueryRunner qr = new QueryRunner(JDBCUtils.getDataSource());
        qr.update(sql, user.getId(), notebookID);
    }

    @Override
    public void markNotebook(User user, int notebookID) throws SQLException {
        String sql = "update notebook set isStart = 1 where userid = ? and id = ?";
        QueryRunner qr = new QueryRunner(JDBCUtils.getDataSource());
        qr.update(sql, user.getId(), notebookID);
}

    @Override
    public void unMarkNotebook(User user, int notebookID) throws SQLException {
        String sql = "update notebook set isStart = 0 where userid = ? and id = ?";
        QueryRunner qr = new QueryRunner(JDBCUtils.getDataSource());
        qr.update(sql, user.getId(), notebookID);
    }
}
