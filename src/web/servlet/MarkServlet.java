package web.servlet;

import domain.Mark;
import domain.User;
import net.sf.json.JSONArray;
import service.MarkService;
import service.service.impl.MarkServiceImpl;
import web.base.BaseServlet.BaseServlet;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;


@WebServlet(name = "MarkServlet")
public class MarkServlet extends BaseServlet {
    public String createMark(HttpServletRequest request, HttpServletResponse response) throws Exception {
        User user = (User) request.getSession().getAttribute("loginUser");
        String markName = request.getParameter("markName");
        Mark mark = new Mark();
        mark.setMarkName(markName);
        String nowTime = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date());
        mark.setCreateTime(Timestamp.valueOf(nowTime));
        MarkService service = new MarkServiceImpl();
        try {
            service.createMark(user, mark);
        } catch (Exception e) {
            e.printStackTrace();
        }

        return null;
    }

    public String listMark(HttpServletRequest request, HttpServletResponse response) throws Exception {
        User user = (User) request.getSession().getAttribute("loginUser");
        MarkService service = new MarkServiceImpl();
        try {
            List<Mark> list = service.listMark(user);
            String jsonStr = JSONArray.fromObject(list).toString();
            response.setContentType("text/html;charset=utf-8");
            response.getWriter().print(jsonStr);
        } catch (Exception e) {
            e.printStackTrace();
        }

        return null;
    }

    public String delMark(HttpServletRequest request, HttpServletResponse response) throws Exception {
        User user = (User) request.getSession().getAttribute("loginUser");
        int markID = Integer.parseInt(request.getParameter("markID"));
        MarkService service = new MarkServiceImpl();
        try {
            service.delMark(user, markID);
            response.setContentType("text/html;charset=utf-8");
            response.getWriter().print("标签已移入废止楼！");
        } catch (Exception e) {
            e.printStackTrace();
        }

        return null;
    }

    public String markTag(HttpServletRequest request, HttpServletResponse response) throws Exception {
        User user = (User) request.getSession().getAttribute("loginUser");
        int markID = Integer.parseInt(request.getParameter("markID"));
        MarkService service = new MarkServiceImpl();
        try {
            service.markTag(user, markID);
            response.setContentType("text/html;charset=utf-8");
            response.getWriter().print("标签已收藏！");
        } catch (Exception e) {
            e.printStackTrace();
        }

        return null;
    }

    public String unMarkTag(HttpServletRequest request, HttpServletResponse response) throws Exception {
        User user = (User) request.getSession().getAttribute("loginUser");
        int markID = Integer.parseInt(request.getParameter("markID"));
        MarkService service = new MarkServiceImpl();
        try {
            service.unMarkTag(user, markID);
            response.setContentType("text/html;charset=utf-8");
            response.getWriter().print("标签已移除收藏！");
        } catch (Exception e) {
            e.printStackTrace();
        }

        return null;
    }
}


