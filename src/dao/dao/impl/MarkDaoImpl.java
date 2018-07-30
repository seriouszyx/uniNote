package dao.dao.impl;

import dao.MarkDao;
import domain.Mark;
import domain.User;
import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanListHandler;
import utils.JDBCUtils;

import java.sql.SQLException;
import java.util.List;

/**
 * @ClassName MarkDaoImpl
 * @Description TODO
 * @Author Yixiang Zhao
 * @Date 2018/7/30 19:15
 * @Version 1.0
 */
public class MarkDaoImpl implements MarkDao {

    @Override
    public void createMark(User user, Mark mark) throws SQLException {
        String sql = "insert into mark values (?, ?, ?, ?, ?, ?, ?)";
        QueryRunner qr = new QueryRunner(JDBCUtils.getDataSource());
        qr.update(sql, mark.getId(), user.getId(), mark.getMarkName(),
                    mark.getIsStart(), mark.getCreateTime(), mark.getUpdateTime(),
                    mark.getIsDelete());
    }

    @Override
    public List<Mark> listMark(User user) throws SQLException {
        String sql = "select * from mark where userid = ? and isDelete = 0";
        QueryRunner qr = new QueryRunner(JDBCUtils.getDataSource());
        return qr.query(sql, new BeanListHandler<Mark>(Mark.class), user.getId());
    }


}
