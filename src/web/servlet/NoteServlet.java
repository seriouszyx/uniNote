package web.servlet;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "NoteServlet")
public class NoteServlet extends HttpServlet {
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

}
