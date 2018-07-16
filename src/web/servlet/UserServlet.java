package web.servlet;

import domain.User;
import service.UserService;
import service.service.impl.UserServiceImpl;
import utils.MyBeanUtils;
import utils.UUIDUtils;
import web.base.BaseServlet.BaseServlet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.Map;

@WebServlet(name = "UserServlet")
public class UserServlet extends BaseServlet {

    /**
     * @Author Yixiang Zhao
     * @Description 实现用户注册
     * @Date 11:16 2018/7/16
     * @Param [request, response]
     * @return java.lang.String
     **/
    public String userSignup(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // 获得参数
        Map<String, String[]> parameterMap = request.getParameterMap();
        User user = new User();
        MyBeanUtils.populate(user, parameterMap);
        user.setId(UUIDUtils.getCode());

        try {
            // 向数据库添加用户信息
            UserService service = new UserServiceImpl();
            service.userSignup(user);
            request.setAttribute("msg", "用户注册成功，请激活");
        } catch (SQLException e) {
            request.setAttribute("msg", "用户注册失败，请重新注册");
        }
        // 响应用户
        return "/jsp/info.jsp";
    }


}
