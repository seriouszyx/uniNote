package web.servlet;

import domain.User;
import net.sf.json.JSONArray;
import service.StarService;
import service.service.impl.StarServiceImpl;
import web.base.BaseServlet.BaseServlet;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.List;

@WebServlet(name = "StarServlet")
public class StarServlet extends BaseServlet {
    public String listStar(HttpServletRequest request, HttpServletResponse response) throws Exception {
        User user = (User) request.getSession().getAttribute("loginUser");
        StarService service = new StarServiceImpl();
        try {
            List<Object> list = service.listStar(user);
            String jsonStr = JSONArray.fromObject(list).toString();
            response.setContentType("text/html;charset=utf-8");
            response.getWriter().print(jsonStr);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }
}
