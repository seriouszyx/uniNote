package web.servlet;

import domain.User;
import service.UserService;
import service.service.impl.UserServiceImpl;
import utils.MailUtils;
import utils.MyBeanUtils;
import utils.UUIDUtils;
import web.base.BaseServlet.BaseServlet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
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
        user.setId(UUIDUtils.getId());
        user.setCode(UUIDUtils.getCode());
        user.setState(0);
        try {
            // 向数据库添加用户信息
            UserService service = new UserServiceImpl();
            service.userSignup(user);

            MailUtils.sendMail(user.getEmail(), user.getCode());
            request.setAttribute("msg", "用户注册成功，请激活");
        } catch (Exception e) {
            request.setAttribute("msg", "用户注册失败，请重新注册");
        }
        // 响应用户
        return "/jsp/info.jsp";
    }

    /**
     * @Author Yixiang Zhao
     * @Description 实现用户注册时的邮箱激活功能
     * @Date 21:15 2018/7/16
     * @Param [request, response]
     * @return java.lang.String
     **/
    public String active(HttpServletRequest request, HttpServletResponse response) throws Exception {
        String code = request.getParameter("code");
        UserService service = new UserServiceImpl();
        boolean flag = service.userActive(code);
        if (true == flag) {
            // 激活成功
            request.setAttribute("msg", "用户激活成功，请登陆！");
            return "/jsp/login.jsp";
        } else {
            // 激活失败
            request.setAttribute("msg", "用户激活失败，请重新激活！");
            return "/jsp/info.jsp";
        }
    }

    /**
     * @Author Yixiang Zhao
     * @Description 实现用户登录功能
     * @Date 11:51 2018/7/17
     * @Param [request, response]
     * @return java.lang.String
     **/
    public String userLogin(HttpServletRequest request, HttpServletResponse response) throws Exception{
        User userTest = new User();
        User user = null;
        MyBeanUtils.populate(userTest, request.getParameterMap());
        UserService service = new UserServiceImpl();
        try {
            user = service.userLogin(userTest);
            // 用户登陆成功
            request.getSession().setAttribute("loginUser", user);
            response.sendRedirect("/jsp/main.jsp");
            return null;
        } catch (Exception e) {
            // 用户登录失败
            String msg = e.getMessage();
            System.out.println(msg);
            request.setAttribute("msg", msg);
            request.getRequestDispatcher("/jsp/login.jsp").forward(request, response);
            return null;
        }
    }

    /**
     * @Author Yixiang Zhao
     * @Description 用户退出功能实现
     * @Date 12:40 2018/7/17
     * @Param [request, response]
     * @return java.lang.String
     **/
    public String logOut(HttpServletRequest request, HttpServletResponse response) throws Exception{
        request.getSession().removeAttribute("loginUser");
        response.sendRedirect("/jsp/login.jsp");
        return null;
    }


}
