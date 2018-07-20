package web.servlet;

import domain.Notebook;
import domain.User;
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
            Map<String, String[]> parameterMap = request.getParameterMap();
            Notebook notebook = new Notebook();
            MyBeanUtils.populate(notebook, parameterMap);
            String nowTime = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date());
            notebook.setCreateTime(Timestamp.valueOf(nowTime));
            User user = (User) request.getSession().getAttribute("loginUser");

            NotebookService service = new NotebookServiceImpl();
            notebook = service.createNotebook(notebook, user);
            // ajax传到前端
            response.getWriter().print(notebook);
        } catch (Exception e) {
            // 创建 失败
            request.setAttribute("msg", "笔记本创建失败，请重新创建！");
            return "/jsp/info.jsp";
        }
        return null;
    }




}
