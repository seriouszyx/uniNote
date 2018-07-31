package web.servlet;

import domain.Notebook;
import domain.User;
import net.sf.json.JSONArray;
import service.NotebookService;
import service.service.impl.NotebookServiceImpl;
import utils.MyBeanUtils;
import web.base.BaseServlet.BaseServlet;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;

@WebServlet(name = "NotebookServlet")
public class NotebookServlet extends BaseServlet {
    /**
     * @Author Yixiang Zhao
     * @Description 创建新的笔记本
     * @Date 15:15 2018/7/20
     * @Param [request, response]
     * @return java.lang.String
     **/
    public String createNotebook(HttpServletRequest request, HttpServletResponse response) throws Exception {

        try {
            Notebook notebook = new Notebook();
            notebook.setBookName(request.getParameter("bookName"));
            String nowTime = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date());
            notebook.setCreateTime(Timestamp.valueOf(nowTime));
            User user = (User) request.getSession().getAttribute("loginUser");

            NotebookService service = new NotebookServiceImpl();
            notebook = service.createNotebook(notebook, user);
            // ajax传到前端
            String jsonStr = JSONArray.fromObject(notebook).toString();
            response.setContentType("text/html;charset=utf-8");
            response.getWriter().print(jsonStr);
        } catch (Exception e) {
            // 创建 失败
            request.setAttribute("msg", "笔记本创建失败，请重新创建！");
            return "/jsp/info.jsp";
        }
        return null;
    }


    /**
     * @Author Yixiang Zhao
     * @Description 查找所有笔记本并发送到前端
     * @Date 9:34 2018/7/24
     * @Param [request, response]
     * @return java.lang.String
     **/
    public String listNotebook(HttpServletRequest request, HttpServletResponse response) throws Exception {
        User user = (User) request.getSession().getAttribute("loginUser");
        NotebookService service = new NotebookServiceImpl();
        try {
            List<Notebook> notebook = service.listNotebook(user);
            response.setContentType("text/html;charset=utf-8");
            String jsonStr = JSONArray.fromObject(notebook).toString();
            response.getWriter().print(jsonStr);
        } catch (Exception e) {
            request.setAttribute("msg", "主页面加载失败！");
            return "/jsp/info.jsp";
        }


        return null;
    }

    /**
     * @Author Yixiang Zhao
     * @Description 将笔记本移入废纸篓
     * @Date 15:00 2018/7/30
     * @Param [request, response]
     * @return java.lang.String
     **/
    public String delNotebook(HttpServletRequest request, HttpServletResponse response) throws Exception {
        User user = (User) request.getSession().getAttribute("loginUser");
        int notebookID = Integer.parseInt(request.getParameter("notebookID"));
        NotebookService service = new NotebookServiceImpl();
        try {
            service.delNotebook(user, notebookID);
            response.setContentType("text/html;charset=utf-8");
            response.getWriter().print("笔记本已移入废纸篓！");
        } catch (Exception e) {
            request.setAttribute("msg", "笔记本删除失败！");
            return "/jsp/info.jsp";
        }
        return null;
    }

    /**
     * @Author Yixiang Zhao
     * @Description 收藏选中的笔记本
     * @Date 16:17 2018/7/30
     * @Param [request, response]
     * @return java.lang.String
     **/
    public String markNotebook(HttpServletRequest request, HttpServletResponse response) throws Exception {
        User user = (User) request.getSession().getAttribute("loginUser");
        int notebookID = Integer.parseInt(request.getParameter("notebookID"));
        NotebookService service = new NotebookServiceImpl();
        try {
            service.markNotebook(user, notebookID);
            response.setContentType("text/html;charset=utf-8");
            response.getWriter().print("笔记本已收藏！");
        } catch (Exception e) {
            request.setAttribute("msg", "笔记本收藏失败！");
            return "/jsp/info.jsp";
        }
        return null;
    }

    /**
     * @Author Yixiang Zhao
     * @Description 取消该笔记本的标记
     * @Date 16:44 2018/7/30
     * @Param [request, response]
     * @return java.lang.String
     **/
    public String unMarkNotebook(HttpServletRequest request, HttpServletResponse response) throws Exception {
        User user = (User) request.getSession().getAttribute("loginUser");
        int notebookID = Integer.parseInt(request.getParameter("notebookID"));
        NotebookService service = new NotebookServiceImpl();
        try {
            service.unMarkNotebook(user, notebookID);
            response.setContentType("text/html;charset=utf-8");
            response.getWriter().print("笔记本已取消标记！");
        } catch (Exception e) {
            request.setAttribute("msg", "笔记本取消标记失败！");
            return "/jsp/info.jsp";
        }
        return null;
    }

}
