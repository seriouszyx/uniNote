package web.servlet;

import domain.Note;
import domain.User;
import net.sf.json.JSONArray;
import service.NoteService;
import service.service.impl.NoteServiceImpl;
import web.base.BaseServlet.BaseServlet;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.List;

@WebServlet(name = "NoteServlet")
public class NoteServlet extends BaseServlet {
    /**
     * @Author Yixiang Zhao
     * @Description 创建新的笔记
     * @Date 17:02 2018/7/20
     * @Param [request, response]
     * @return java.lang.String
     **/
    public String createNote(HttpServletRequest request, HttpServletResponse response) throws Exception {
        System.out.println(request.getParameter("notebookName"));
        return null;
    }

    /**
     * @Author Yixiang Zhao
     * @Description 查找笔记
     * @Date 9:32 2018/7/30
     * @Param [request, response]
     * @return java.lang.String
     **/
    public String searchNote(HttpServletRequest request, HttpServletResponse response) throws Exception {
        User user = (User) request.getSession().getAttribute("loginUser");
        String keyword = request.getParameter("keyword");
        NoteService service = new NoteServiceImpl();
        try {
            List<Note> notes = service.searchNote(user, keyword);
            String jsonStr = JSONArray.fromObject(notes).toString();
            response.setContentType("text/html;charset=utf-8");
            response.getWriter().print(jsonStr);
        } catch (Exception e) {
            request.setAttribute("msg", "笔记查找失败");
            return "/jsp/info.jsp";
        }
        return null;
    }

    /**
     * @Author Yixiang Zhao
     * @Description 收藏笔记
     * @Date 10:49 2018/7/30
     * @Param [request, response]
     * @return java.lang.String
     **/
    public String starNote(HttpServletRequest request, HttpServletResponse response) throws Exception {
        User user = (User) request.getSession().getAttribute("loginUser");
        int noteID = Integer.parseInt(request.getParameter("noteID"));
        NoteService service = new NoteServiceImpl();
        try {
            service.starNote(user, noteID);
            response.setContentType("text/html;charset=utf-8");
            response.getWriter().print("笔记收藏成功！");
        } catch (Exception e) {
            request.setAttribute("msg", "笔记收藏失败");
            return "/jsp/info.jsp";
        }
        return null;
    }

}
