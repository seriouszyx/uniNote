package web.servlet;

import domain.Mark;
import domain.Note;
import domain.Notebook;
import domain.User;
import net.sf.json.JSONArray;
import service.BinService;
import service.service.impl.BinServiceImpl;
import web.base.BaseServlet.BaseServlet;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.ArrayList;
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
        List<Object> list = new ArrayList<>();
        try {
            List<Note> noteList = service.listNoteInBin(user);
            list.add(noteList);

            List<Notebook> notebookList = service.listNotebookInBin(user);
            list.add(notebookList);

            List<Mark> markList = service.listMarkInBin(user);
            list.add(markList);

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

    public String RecoverNotebookInBin(HttpServletRequest request, HttpServletResponse response) throws Exception{
        User user = (User) request.getSession().getAttribute("loginUser");
        int id = Integer.parseInt(request.getParameter("notebookIDInBin"));
        BinService service = new BinServiceImpl();
        try {
            service.RecoverNotebookInBin(user, id);
            response.setContentType("text/html;charset=utf-8");
            response.getWriter().print("笔记本还原成功");
        } catch (Exception e) {
            request.setAttribute("msg", "笔记本还原失败！");
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

    public String removeNotebookInBin(HttpServletRequest request, HttpServletResponse response) throws Exception{
        User user = (User) request.getSession().getAttribute("loginUser");
        int id = Integer.parseInt(request.getParameter("notebookInBinID"));
        BinService service = new BinServiceImpl();
        try {
            service.removeNotebookInBin(user, id);
            response.setContentType("text/html;charset=utf-8");
            response.getWriter().print("笔记本已移除");
        } catch (Exception e) {
            request.setAttribute("msg", "笔记本移除失败！");
            return "/jsp/info.jsp";
        }
        return null;
    }

    public String clearNoteInBin(HttpServletRequest request, HttpServletResponse response) throws Exception{
        User user = (User) request.getSession().getAttribute("loginUser");
        BinService service = new BinServiceImpl();
        try {
            service.clearNoteInBin(user);
            response.setContentType("text/html;charset=utf-8");
            response.getWriter().print("废纸篓已清空");
        } catch (Exception e) {
            request.setAttribute("msg", "废纸篓清空失败！");
            return "/jsp/info.jsp";
        }
        return null;
    }

    public String removeMarkInBin(HttpServletRequest request, HttpServletResponse response) throws Exception{
        User user = (User) request.getSession().getAttribute("loginUser");
        int markInBin = Integer.parseInt(request.getParameter("markInBin"));
        BinService service = new BinServiceImpl();
        try {
            service.removeMarkInBin(user, markInBin);
            response.setContentType("text/html;charset=utf-8");
            response.getWriter().print("标签已移除");
        } catch (Exception e) {
            request.setAttribute("msg", "标签移除失败！");
            return "/jsp/info.jsp";
        }
        return null;
    }

    public String RecoverMarkInBin(HttpServletRequest request, HttpServletResponse response) throws Exception{
        User user = (User) request.getSession().getAttribute("loginUser");
        int id = Integer.parseInt(request.getParameter("markInBin"));
        BinService service = new BinServiceImpl();
        try {
            service.RecoverMarkInBin(user, id);
            response.setContentType("text/html;charset=utf-8");
            response.getWriter().print("标签还原成功");
        } catch (Exception e) {
            request.setAttribute("msg", "标签还原失败！");
            return "/jsp/info.jsp";
        }
        return null;
    }
}
