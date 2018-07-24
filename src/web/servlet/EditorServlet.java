package web.servlet;

import domain.Note;
import domain.User;
import service.NoteService;
import service.service.impl.NoteServiceImpl;
import web.base.BaseServlet.BaseServlet;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.Date;

@WebServlet(name = "EditorServlet")
public class EditorServlet extends BaseServlet {
    /**
     * @Author Yixiang Zhao
     * @Description 创建新笔记
     * @Date 15:28 2018/7/23
     * @Param [request, response]
     * @return java.lang.String
     **/
    public String createNote(HttpServletRequest request, HttpServletResponse response) throws Exception{
        Note note = new Note();
        note.setContent(request.getParameter("getJson"));
        note.setNotebookID("1");
        String nowTime = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date());
        note.setCreateTime(Timestamp.valueOf(nowTime));
        User user = (User) request.getSession().getAttribute("loginUser");
        // 标题
        note.setTitle("test");
        try {
            NoteService service = new NoteServiceImpl();
            service.createNote(user, note);
            response.setContentType("text/html;charset=utf-8");
            response.getWriter().print("笔记创建成功");
        } catch (Exception e) {
            // 创建 失败
            request.setAttribute("msg", "笔记创建失败，请重新创建！");
            return "/jsp/info.jsp";
        }
        return null;
    }
}
