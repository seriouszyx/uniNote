package service.service.impl;

import dao.MarkDao;
import dao.NoteDao;
import dao.NotebookDao;
import dao.dao.impl.MarkDaoImpl;
import dao.dao.impl.NoteDaoImpl;
import dao.dao.impl.NotebookDaoImpl;
import domain.User;
import service.StarService;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 * @ClassName StarServiceImpl
 * @Description TODO
 * @Author Yixiang Zhao
 * @Date 2018/7/31 13:11
 * @Version 1.0
 */
public class StarServiceImpl implements StarService {

    @Override
    public List<Object> listStar(User user) throws SQLException {
        List<Object> list = new ArrayList<>();
        NotebookDao notebookDao = new NotebookDaoImpl();
        NoteDao noteDao = new NoteDaoImpl();
        MarkDao markDao = new MarkDaoImpl();
        list.add(notebookDao.listStar(user));
        list.add(noteDao.listStar(user));
        list.add(markDao.listStar(user));
        return list;
    }
}
