<%--
  Created by IntelliJ IDEA.
  User: seriouszyx
  Date: 2018/7/16
  Time: 10:58
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="domain.User" %>
<%@ page import="java.net.URLDecoder" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <title>Dynamic Single Page Login + Sign Up</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href='https://fonts.googleapis.com/css?family=Roboto:300,400,600' rel='stylesheet' type='text/css'>
    <link rel="stylesheet" href="../css/login.css">


</head>

<body>
<%
    String msg = (String)request.getAttribute("msg");
    if(msg != null) {
%>
<script type="text/javascript" language="javascript">
    alert("<%=msg%>");
    window.location = '/jsp/login.jsp';
</script>
<%
    }
%>
<!--
    自动登陆处理
-->
<%
    Cookie[] cookies=request.getCookies();
    String username = null;
    String password = null;
    if(cookies!=null){
        for(int i=0;i<cookies.length;i++){
            String name = cookies[i].getName();
            if("username".equals(name)){
                username = URLDecoder.decode(cookies[i].getValue(), "utf-8");
            }else if("password".equals(name)){
                password = cookies[i].getValue();
            }
        }
    }
    //当用户名和密码不为空时，自动登录
    if((username!=null&&!("".equals(username)))&&(password!=null&&!("".equals(password)))){
        session.setAttribute("username", username);
        session.setAttribute("password", password);
        response.sendRedirect(request.getContextPath()+"/UserServlet?method=autoLogin");
    }
%>

<div id="back">
    <canvas id="canvas" class="canvas-back"></canvas>
    <div class="backRight">
    </div>
    <div class="backLeft">
    </div>
</div>

<div class="foo" id="left-letter">
    <span class="letter" data-letter="u">u</span>
    <span class="letter" data-letter="n">n</span>
    <span class="letter" data-letter="i">i</span>
    <span class="letter" data-letter="N">N</span>
    <span class="letter" data-letter="o">o</span>
    <span class="letter" data-letter="t">t</span>
    <span class="letter" data-letter="e">e</span>
</div>

<div id="right-letter">
    <b>Note</b>
    <b>the</b>
    <b>Universe</b>
</div>

<div id="slideBox">
    <div class="topLayer">
        <div class="left" style="overflow-x: hidden;overflow-y: hidden">
            <div class="content">
                <h2>Sign Up</h2>
                <form id="form-signup" method="post"
                      action="${pageContext.request.contextPath}/UserServlet?method=userSignup">
                    <div class="form-element form-stack">
                        <label for="email" class="form-label">Email</label>
                        <input id="email" type="email" name="email">
                        <span class="spanStyle" id="mailboxSpan">*</span>
                    </div>
                    <div class="form-element form-stack">
                        <label for="username-signup" class="form-label">Username</label>
                        <input id="username-signup" type="text" name="username">
                        <span class="spanStyle" id="usernameSpan">*</span>
                    </div>
                    <div class="form-element form-stack">
                        <label for="password-signup" class="form-label">Password</label>
                        <input id="password-signup" type="password" name="password">
                        <span class="spanStyle" id="passwordSpan">*</span>
                    </div>
                    <div class="form-element form-stack">
                        <label for="password-signup" class="form-label">Confirm password</label>
                        <input id="repassword" type="password" name="repwd" >
                        <span class="spanStyle" id="repasswordSpan">*</span>

                    </div>
                    <div class="form-element form-submit">
                        <button id="signUp" class="signup" type="submit" name="signup">Sign up</button>
                        <button id="goLeft" class="signup off">Log In</button>
                    </div>
                </form>
            </div>
        </div>
        <div class="right">
            <div class="content">
                <h2>Login</h2>
                <form id="form-login" method="post"
                      action="${pageContext.request.contextPath}/UserServlet?method=userLogin">
                    <div class="form-element form-stack">
                        <label for="username-login" class="form-label">Username</label>
                        <input id="username-login" type="text" name="username">
                    </div>
                    <div class="form-element form-stack">
                        <label for="password-login" class="form-label">Password</label>
                        <input id="password-login" type="password" name="password">
                    </div>
                    <div class="form-element form-checkbox  right-chexbox">
                        <input type="checkbox" name="confirm" value="yes" class="checkbox">
                        <label for="confirm-terms">Remember me</label>
                    </div>
                    <div class="form-element form-submit">
                        <button id="logIn" class="login" type="submit" name="login">Log In</button>
                        <button id="goRight" class="login off" name="signup">Sign Up</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>

<script src='https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.js'></script>
<script src='https://cdnjs.cloudflare.com/ajax/libs/paper.js/0.11.3/paper-full.min.js'></script>
<script src="http://cdn.ronghub.com/RongIMLib-2.2.4.min.js"></script>

<script src="../js/login.js"></script>

</body>

</html>
