package web.servlet;

import domain.Note;
import domain.Notebook;
import domain.User;
import net.sf.json.JSONArray;
import service.NoteService;
import service.service.impl.NoteServiceImpl;
import web.base.BaseServlet.BaseServlet;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

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
        note.setContent(request.getParameter("getHTML"));
        String nowTime = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date());
        note.setCreateTime(Timestamp.valueOf(nowTime));
        User user = (User) request.getSession().getAttribute("loginUser");
        // 标题
        note.setTitle(request.getParameter("noteName"));
        String notebookName = request.getParameter("notebookName");
        String markName = request.getParameter("markName");
        try {
            NoteService service = new NoteServiceImpl();
            service.createNote(user, note, notebookName, markName);
            String jsonStr = JSONArray.fromObject(note).toString();
            response.setContentType("text/html;charset=utf-8");
            response.getWriter().print(jsonStr);
        } catch (Exception e) {
            // 创建 失败
            request.setAttribute("msg", "笔记创建失败，请重新创建！");
            return "/jsp/info.jsp";
        }
        return null;
    }

    /**
     * @Author Yixiang Zhao
     * @Description 查找所有笔记并部署到主页面上
     * @Date 17:05 2018/7/24
     * @Param [request, response]
     * @return java.lang.String
     **/
    public String listNote(HttpServletRequest request, HttpServletResponse response) throws Exception{
        User user = (User) request.getSession().getAttribute("loginUser");
        NoteService service = new NoteServiceImpl();
        Notebook notebook = new Notebook();
        notebook.setId(Integer.parseInt(request.getParameter("notebookID")));
        try {
            List<Note> list = service.listNote(user, notebook);
            String jsonStr = JSONArray.fromObject(list).toString();
            response.setContentType("text/html;charset=utf-8");
            response.getWriter().print(jsonStr);
        } catch (Exception e) {
            request.setAttribute("msg", "页面部署失败，请重新加载");
            return "/jsp/info.jsp";
        }

        return null;
    }

    /**
     * @Author Yixiang Zhao
     * @Description 根据笔记的ID找到整个笔记信息
     * @Date 17:38 2018/7/24
     * @Param [request, response]
     * @return java.lang.String
     **/
    public String findContent(HttpServletRequest request, HttpServletResponse response) throws Exception{
        int noteID = Integer.parseInt(request.getParameter("noteID"));
        NoteService service = new NoteServiceImpl();
        try {
            Note note = service.findContent(noteID);
            String jsonStr = JSONArray.fromObject(note).toString();
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
     * @Description 保存当前笔记
     * @Date 20:07 2018/7/24
     * @Param [request, response]
     * @return java.lang.String
     **/
    public String saveNote(HttpServletRequest request, HttpServletResponse response) throws Exception{
        Note note = new Note();
        note.setContent(request.getParameter("getHTML"));
        String nowTime = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date());
        note.setUpdateTime(Timestamp.valueOf(nowTime));
        int noteID = Integer.parseInt(request.getParameter("noteID"));

        try {
            NoteService service = new NoteServiceImpl();
            service.saveNote(note, noteID);
            response.setContentType("text/html;charset=utf-8");
            response.getWriter().print("笔记保存成功！");
        } catch (Exception e) {
            request.setAttribute("msg", "笔记保存失败");
            return "/jsp/info.jsp";
        }
        return null;
    }

    /**
     * @Author Yixiang Zhao
     * @Description 删除笔记至废纸篓
     * @Date 20:51 2018/7/24
     * @Param [request, response]
     * @return java.lang.String
     **/
    public String delNote(HttpServletRequest request, HttpServletResponse response) throws Exception{
        int noteID = Integer.parseInt(request.getParameter("noteID"));
        try {
            NoteService service = new NoteServiceImpl();
            service.delNote(noteID);
            response.setContentType("text/html;charset=utf-8");
            response.getWriter().print("笔记删除成功！");
        } catch (Exception e) {
            request.setAttribute("msg", "笔记删除失败");
            return "/jsp/info.jsp";
        }


        return null;
    }
}
