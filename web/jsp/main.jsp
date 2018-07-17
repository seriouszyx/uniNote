<%--
  Created by IntelliJ IDEA.
  User: seriouszyx
  Date: 2018/7/17
  Time: 10:05
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="domain.User" %>
<html>

<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />

    <!--
    作者：offline
    时间：2018-07-13
    描述：link Css
-->
    <link href="../css/share.css" rel="stylesheet" type="text/css">
    <link rel="stylesheet" href="../css/hover.css">
    <link rel="stylesheet" href="../css/Position.css" />
    <link rel="stylesheet" href="../css/style.css" />
    <link href="http://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <link rel="stylesheet" href="../css/Initialization.css" />
    <link type="text/css" rel="stylesheet" href="../css/materialize.css" media="screen,projection" />
    <link rel="stylesheet" type="text/css" href="../css/index.css">
    <link rel="stylesheet" type="text/css" href="http://www.jq22.com/jquery/font-awesome.4.6.0.css">
    <link href="../createCss/froala_editor.min.css" rel="stylesheet" type="text/css">

    <!--
    作者：offline
    时间：2018-07-13
    描述：link Css
-->
    <title>hiNote</title>
</head>
    <!--
        session:
            loginUser 用户登陆信息
    -->

<body>
<c:if test="${empty loginUser}">
    <script type="text/javascript" language="javascript">
        alert("请登陆您的账号");
        window.location = '/jsp/login.jsp';
    </script>
</c:if>


<ul id="slide-out" class="side-nav " style="min-width: 275px;width: 19%;">
    <!--left-side-out-->
    <li>
        <div class=" userView">
            <div class="background">
                <img src="../images/test4.jpg">
                <!--User background-->
            </div>
            <a href="#!user"><img class="circle" src="../images/background2.jpg"></a>
            <!--User Head portrait-->
            <a href="#!name"><span class="white-text name">${loginUser.username}</span></a>
            <a href="#!email"><span class="white-text email">${loginUser.email}</span></a>
        </div>
    </li>
    <li>
        <!--Member information-->
        <a href="../UserInformation.html" target="_blank" class="waves-effect waves-light btn card-panel hoverable flow-text"><i class="material-icons">perm_identity</i>Personal</a>
    </li>
    <li>
        <!--Create a new note-->
        <a href="#!" class="waves-effect waves-light btn card-panel hoverable flow-text"><i class="material-icons">mode_edit</i>Create Notes</a>
    </li>
    <li>
        <!--Find note-->
        <a href="#!" class="waves-effect waves-light btn card-panel hoverable flow-text"><i class="material-icons">search</i>Search Notes</a>
    </li>
    <li>
        <!--Note book-->
        <a href="../NoteBook/index.html" target="_blank" class="waves-effect waves-light btn card-panel hoverable flow-text"><i class="material-icons">view_headline</i>Note Books</a>
    </li>
    <li>
        <!--Note mark-->
        <a href="#!" class="waves-effect waves-light btn card-panel hoverable flow-text"><i class="material-icons">star</i>Mark</a>
    </li>
    <li>
        <!--Note delete-->
        <a href="#!" class="waves-effect waves-light btn card-panel hoverable flow-text"><i class="material-icons">delete</i>Trash</a>
    </li>
    <li>
        <!--Note settings-->
        <a href="#!" class="waves-effect waves-light btn card-panel hoverable flow-text"><i class="material-icons">settings</i>Settings</a>
    </li>
    <li>
        <!--About us-->
        <a href="#!" href="javascript:void(0)" class="share waves-effect waves-light btn card-panel hoverable flow-text"><i class="material-icons">open_in_new</i>Share</a>
    </li>
    <li>
        <!--Log out-->
        <a href="${pageContext.request.contextPath}/UserServlet?method=logOut" class="share waves-effect waves-light btn card-panel hoverable flow-text"><i class="material-icons"></i>LOG OUT</a>
    </li>
</ul>
<!--Click to show user's information-->
<a href="#" data-activates="slide-out" class="  button-collapse "><i class="  btn " id="infor"><i  class=" material-icons" id="information">perm_identity</i></i>
</a>
<!--*************************************************************************************************************************-->
<!--Main-->
<br><br><br>
<div id="order_nav">
    <div class="auto_width height100">
        <ul class="list not_ie">
            <li class="BUTTON">
                <div class="ico _6">
                    <a href="#" onclick="noteBooks()"></a>
                </div>
                <p><span>Note Books</span></p>
            </li>
            <li class="BUTTON">
                <div class="ico _3">
                    <a href="#" onclick="create()"></a>
                </div>
                <p><span>Create Note</span></p>
            </li>
            <li class="BUTTON">
                <div class="ico _2">
                    <a href="#"></a>
                </div>
                <p><span>标签分类</span></p>
            </li>
            <li class="BUTTON">
                <div class="ico _4">
                    <a href="#"></a>
                </div>
                <p><span>Trash</span></p>
            </li>

        </ul>
    </div>
</div>


<!--*************************************************************************************************************************-->
<!--右下角隐藏add标签-->
<div id="divrightdown">
    <div id="showUp" style="width: 100px;height: 100px;background-color: red;    position: absolute;
    right: 0;
    bottom: 79px;display: none;"></div>
    <div class="fixed-action-btn  toolbar" style="width: 56px;" onclick="showUp()">

        <a class="btn-floating waves-effect waves-light RDF btn-large 2bba30">
            <i class="large material-icons">add</i>
        </a>

    </div>

</div>
<!--*************************************************************************************************************************-->

<!--*************************************************************************************************************************-->

<section id="createNote" style="width:685px;position: relative;left: 27.5%;color: black;font-size: 14px;display: none;">
    <div id="div1">
        <p id="time">时间：2018/7/16 16:08</p>
    </div>
    <button id="btn1">获取html</button>
    <button id="btn2">获取text</button>
    <button id="btn3">重写</button>
    <button id="btn4">getJSON</button>
</section>

<!--
作者：offline
时间：2018-07-15
描述：笔记本目录
-->

<div id="noteBooks" style="width: 60%;min-width: 145px;height: 48%;background-color: white;position: relative;left: 20%;display: none ;border:1px solid #666;overflow:hidden;vertical-align:middle;border-radius: 8px;">
    <form action="#">

        <p style="margin-left: 5%;">
            <b style="font-size: 15px;">目录</b>
            <b style="float: right;margin-right: 5%;">标记情况</b>
        </p>
        <p style="margin-top: 20px;margin-left: 5%;">
            <a id="tese" href="#" style="font-size: 15px;">笔记本1</a>
            <input type="checkbox" id="test5" />
            <!-- checked="checked" -->
            <label for="test5" style="float: right;margin-right: 5%;"></label>
        </p>
        <br />
        <p style="margin-top: 20px;margin-left: 5%;">
            <a href="#" style="font-size: 15px;">24号的笔记</a>
            <input type="checkbox" id="test6" />
            <!-- checked="checked" -->
            <label for="test6" style="float: right;margin-right: 5%;"></label>
        </p>
        <br />
        <p style="margin-top: 20px;margin-left: 5%;">
            <a href="#" style="font-size: 15px;">15号备忘录</a>
            <input type="checkbox" id="test4" />
            <!-- checked="checked" -->
            <label for="test4" style="float: right;margin-right: 5%;"></label>
        </p>
        <br />
        <p style="margin-top: 20px;margin-left: 5%;">
            <a href="#" style="font-size: 15px;">数学作业</a>
            <input type="checkbox" id="test3" />
            <!-- checked="checked" -->
            <label for="test3" style="float: right;margin-right: 5%;"></label>
        </p>
        <br />
        <p style="margin-top: 20px;margin-left: 5%;">
            <a href="#" style="font-size: 15px;">tesqwwefawgwgsdt</a>
            <input type="checkbox" id="test2" />
            <!-- checked="checked" -->
            <label for="test2" style="float: right;margin-right: 5%;"></label>
        </p>

    </form>
</div>

<!--*************************************************************************************************************************-->

</body>

<script type="text/javascript" src="../js/wangEditor.min.js"></script>
<script src="../js/jquery-1.8.3.min.js"></script>
<script type="text/javascript" src="../js/share.js"></script>
<script type="text/javascript" src='../js/TweenMax.min.js'></script>
<script type="text/javascript" src='../js/MorphSVGPlugin.min.js'></script>
<script type="text/javascript" src="../js/Function.js"></script>
<script type="text/javascript" src="../js/materialize.js"></script>
<script type="text/javascript" src="../js/Initialization.js"></script>
<script type="text/javascript" src="../js/index.js"></script>
<script type="text/javascript" src="../js/jq.js"></script>
<script type="text/javascript" src="../js/style.js"></script>


</html>
