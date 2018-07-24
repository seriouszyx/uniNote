package web.servlet;

import domain.Note;
import domain.User;
import net.sf.json.JSONArray;
import service.BinService;
import service.service.impl.BinServiceImpl;
import web.base.BaseServlet.BaseServlet;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.List;


@WebServlet(name = "BinServlet")
public class BinServlet extends BaseServlet {
    /**
     * @Author Yixiang Zhao
     * @Description 查看废纸篓中的笔记
     * @Date 21:22 2018/7/24
     * @Param [noteID]
     * @return domain.Note
     **/
    public String listNoteInBin(HttpServletRequest request, HttpServletResponse response) throws Exception{
        User user = (User) request.getSession().getAttribute("loginUser");
        BinService service = new BinServiceImpl();
        try {
            List<Note> list = service.listNoteInBin(user);
            String jsonStr = JSONArray.fromObject(list).toString();
            response.setContentType("text/html;charset=utf-8");
            response.getWriter().print(jsonStr);
        } catch (Exception e) {
            request.setAttribute("msg", "废纸篓读取失败！");
            return "/jsp/info.jsp";
        }
        return null;
    }

    public String RecoverNoteInBin(HttpServletRequest request, HttpServletResponse response) throws Exception{
        User user = (User) request.getSession().getAttribute("loginUser");
        int id = Integer.parseInt(request.getParameter("noteIDInBin"));
        BinService service = new BinServiceImpl();
        try {
            service.RecoverNoteInBin(user, id);
            response.setContentType("text/html;charset=utf-8");
            response.getWriter().print("笔记还原成功");
        } catch (Exception e) {
            request.setAttribute("msg", "笔记还原失败！");
            return "/jsp/info.jsp";
        }
        return null;
    }

    public String removeNoteInBin(HttpServletRequest request, HttpServletResponse response) throws Exception{
        User user = (User) request.getSession().getAttribute("loginUser");
        int id = Integer.parseInt(request.getParameter("noteIDInBin"));
        BinService service = new BinServiceImpl();
        try {
            service.removeNoteInBin(user, id);
            response.setContentType("text/html;charset=utf-8");
            response.getWriter().print("笔记已移除");
        } catch (Exception e) {
            request.setAttribute("msg", "笔记移除失败！");
            return "/jsp/info.jsp";
        }
        return null;
    }
}
