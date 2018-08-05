package web.servlet;

import domain.Notebook;
import domain.User;
import io.rong.RongCloud;
import io.rong.models.response.TokenResult;
import io.rong.models.user.UserModel;
import net.sf.json.JSONArray;
import service.NotebookService;
import service.UserService;
import service.service.impl.NotebookServiceImpl;
import service.service.impl.UserServiceImpl;
import utils.MD5Utils;
import utils.MailUtils;
import utils.MyBeanUtils;
import utils.UUIDUtils;
import web.base.BaseServlet.BaseServlet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.net.URLEncoder;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.Date;
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
        user.setPassword(MD5Utils.md5(user.getPassword()));
        user.setId(UUIDUtils.getId());
        user.setCode(UUIDUtils.getCode());
        user.setState(0);
        String nowTime = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date());
        user.setCreateTime(Timestamp.valueOf(nowTime));
        try {
            // 向数据库添加用户信息
            UserService service = new UserServiceImpl();
            service.userSignup(user);
            // 融云获取用户token
            // initRY(user);
            // 为用户创建初始笔记本
            initNotebook(user);
            // 发送邮件信息
            MailUtils.sendMail(user.getEmail(), user.getCode());
            // 响应消息
            request.setAttribute("msg", "用户注册成功，请激活");
        } catch (Exception e) {
            request.setAttribute("msg", "用户注册失败，请重新注册");
        }
        // 响应用户
        return "/jsp/info.jsp";
    }

    public void initNotebook(User user) {
        try {
            Notebook notebook = new Notebook();
            notebook.setBookName("我的第一个笔记本");
            String nowTime = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date());
            notebook.setCreateTime(Timestamp.valueOf(nowTime));
            NotebookService service = new NotebookServiceImpl();
            notebook = service.createNotebook(notebook, user);
        } catch (Exception e) {
            // 创建 失败
            e.printStackTrace();
        }
    }

    public void initRY(User u) throws Exception {
        String appKey = "8w7jv4qb826py";
        String appSecret = "OCjWhhgXd1mwfC";

        RongCloud rongCloud = RongCloud.getInstance(appKey, appSecret);
        io.rong.methods.user.User User = rongCloud.user;

        UserModel user = new UserModel()
                .setId(u.getId())
                .setName(u.getName());
        TokenResult result = null;
        result = User.register(user);
        System.out.println("getToken:  " + result.toString());
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

        String autoLogin = request.getParameter("confirm");
        UserService service = new UserServiceImpl();
        try {
            user = service.userLogin(userTest);
            //若用户选择自动登录，则生成cookies保存必要信息
            if("yes".equals(autoLogin)){
                Cookie cookie = new Cookie("username", URLEncoder.encode(user.getUsername(), "utf-8"));
                Cookie cookie2 = new Cookie("password",user.getPassword());
                //设置保存时间
                cookie.setMaxAge(7*24*60*60);
                cookie2.setMaxAge(7*24*60*60);
                //设置保存路径
                cookie.setPath(request.getContextPath()+"/");
                //添加到响应头
                response.addCookie(cookie);
                response.addCookie(cookie2);
            }
            // 用户登陆成功
            request.getSession().setAttribute("loginUser", user);
            response.sendRedirect("/jsp/index.jsp");
            return null;
        } catch (Exception e) {
            // 用户登录失败
            String msg = e.getMessage();
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
        request.setAttribute("msg", "您已经退出登录！");
        response.sendRedirect("/jsp/logout.jsp");
        return null;
    }

    /**
     * @Author Yixiang Zhao
     * @Description 自动登陆的信息处理
     * @Date 15:49 2018/7/17
     * @Param [request, response]
     * @return java.lang.String
     **/
    public String autoLogin(HttpServletRequest request, HttpServletResponse response) throws Exception{
        HttpSession session = request.getSession();
        String username = (String)session.getAttribute("username");
        String password = (String)session.getAttribute("password");
        User user = new User();
        user.setUsername(username);
        user.setPassword(password);
        UserService service = new UserServiceImpl();
        try {
            user = service.userLogin(user);
            // 用户登陆成功
            request.getSession().setAttribute("loginUser", user);
            response.sendRedirect("/jsp/index.jsp");
        } catch (Exception e)  {
            String msg = e.getMessage();
            request.setAttribute("msg", msg);
            request.getRequestDispatcher("/jsp/login.jsp").forward(request, response);
        }

        return null;
    }


}
