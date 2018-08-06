<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>

<head>
    <meta charset="utf-8" />
    <title>HelloNote</title>
</head>
<link href="../css/style.css" rel="stylesheet">
<link href="../css/font-awesome.css" rel="stylesheet">
<script type="text/javascript" src="../js/jq.js"></script>
<link rel="stylesheet" href="http://apps.bdimg.com/libs/jqueryui/1.10.4/css/jquery-ui.min.css">
<script src="http://apps.bdimg.com/libs/jqueryui/1.10.4/jquery-ui.min.js"></script>
<script src="http://tjs.sjs.sinajs.cn/open/api/js/wb.js" type="text/javascript" charset="utf-8"></script>
<script type="text/javascript" src="http://widget.renren.com/js/rrshare.js"></script>
<script type="text/javascript" src="../js/style.js"></script>
<script type="text/javascript" charset="utf-8" src="http://static.bshare.cn/b/buttonLite.js#style=-1&amp;uuid=&amp;pophcol=2&amp;lang=zh"></script>
<script type="text/javascript" charset="utf-8" src="http://static.bshare.cn/b/bshareC0.js"></script>
<script type="text/javascript" src="../wangEditor-3.1.1/release/wangEditor.min.js"></script>
<script src="http://cdn.ronghub.com/RongIMLib-2.2.4.min.js"></script>

<body onload="init()">
<c:if test="${empty loginUser}">
    <script type="text/javascript" language="javascript">
        alert("请登陆您的账号");
        window.location = '/jsp/login.jsp';
    </script>
</c:if>


<div id="top">
    <div id="helloUser">
        <div>${loginUser.username},欢迎您！</div>
    </div>
    <!--	*************ADD****************		-->
    <div id="middle">

        <div class="img2" onclick="ShowDiv('MyDiv5','fade5')" style="width: 32px; height: 32px;"><img src="../img/6.png" style="width: 19px; height: 19px;"></div>
        <!--弹出层时背景层DIV-->
        <div id="fade5" class="black_overlay1">
        </div>

        <div id="MyDiv5" class="white_content1">

            <div style="text-align: right; cursor: default; height: 40px;">
                <span style="font-size: 16px;" onclick="CloseDiv('MyDiv5','fade5')"><img class="cut" src="../img/5.png"></span>
            </div>
            <div class="delect1"><img src="../img/12.png" style="width: 40px; height: 40px;"></div>

            <div class="remind"> <input type="button" value="标记完成"></div>
            <div class="remind"> <input type="button" value="清除提醒"></div>
            <div class="remind"> <input type="button" value="通知我"></div>

        </div>

        <div class="img2" onclick="ShowDiv('MyDiv6','fade6')" style="width: 32px; height: 32px;"><img src="../img/7.png" style="width: 20px; height: 20px;"></div>
        <!--弹出层时背景层DIV-->
        <div id="fade6" class="black_overlay1">
        </div>

        <div id="MyDiv6" class="white_content1">

            <div style="text-align: right; cursor: default; height: 40px;">
                <span style="font-size: 16px;" onclick="CloseDiv('MyDiv6','fade6')"><img class="cut" src="../img/5.png"></span>
            </div>
            <div class="delect">
                <div class="delect1"><img src="../img/13.png" style="width: 40px; height: 40px;"></div>
                <p>快捷方式</p>
                <div class="delect2"></div>
                <h1>确认添加快捷方式？</h1>

                <div class="delect5">	<input class="cancel" type="button" value="否">
                    <input id="starNoteBtn"  class="confirm" type="button" value="是"></div>
            </div>

        </div>

        <div class="img2" id="msgBtn" style="width: 32px; height: 32px;"><img src="../img/8.png" style="width: 22px; height: 22px;"></div>
        <!--弹出层时背景层DIV-->
        <div id="fade7" class="black_overlay1">
        </div>

        <div id="MyDiv7" class="white_content1">

            <div style="text-align: right; cursor: default; height: 40px;">
                <span style="font-size: 16px;" onclick="CloseDiv('MyDiv7','fade7')"><img class="cut" src="../img/5.png"></span>
            </div>
            <div class="delect">
                <div class="delect1"><img src="../img/8.png" style="width: 40px; height: 40px;"></div>
                <p>笔记信息</p>
                <div class="delect2"></div>
                <div id="NoteMsg">

                </div>
                <div class="delect5">	<input class="cancel" type="button" value="取消">
                    <input class="confirm" type="button" value="保存"></div>
            </div>

        </div>

        <div class="img2" onclick="ShowDiv('MyDiv8','fade8')" style="width: 32px; height: 32px;"><img src="../img/9.png" style="width: 20px; height: 20px;"></div>
        <!--弹出层时背景层DIV-->
        <div id="fade8" class="black_overlay1">
        </div>

        <div id="MyDiv8" class="white_content1">

            <div style="text-align: right; cursor: default; height: 40px;">
                <span style="font-size: 16px;" onclick="CloseDiv('MyDiv8','fade8')"><img class="cut" src="../img/5.png"></span>
            </div>
            <div class="delect">
                <div class="delect1"><img src="../img/9.png" style="width: 40px; height: 40px;"></div>
                <p>删除笔记</p>
                <div class="delect2"></div>
                <h1>确认删除吗？</h1>

                <div class="delect5">	<input class="cancel" type="button" value="取消">
                    <input id="delNoteBtn" class="confirm" type="button" value="删除"></div>
            </div>

        </div>

        <div id="codeOpen" class="img2" style="width: 32px; height: 32px;"><img src="../img/10.png" style="width: 20px; height: 20px;"></div>
        <!--弹出层时背景层DIV-->
        <div id="fade9" class="black_overlay1">
        </div>

        <div id="MyDiv9" class="white_content1">

            <div style="text-align: center; cursor: default; height: 40px;">
                <span style="font-size: 16px;" onclick="CloseDiv('MyDiv9','fade9')"><img class="cut" src="../img/5.png"></span>
            </div>
            <div>
                <form>
                    <table id="createNotePop"  border="0" cellspacing="0" cellpadding="0"
                           style="margin-left: 140px; margin-top: 30px; width: 350px; height: 150px;;">
                        <tr>
                            <td align="right">笔记名：</td>
                            <td align="center"><input style="width: 175px;" id="noteName" type="text" placeholder="笔记名"></td>
                        </tr>
                        <tr>
                            <td align="right">笔记本名：</td>
                            <td align="center">
                                <select id="notebookName" style="width: 175px;">
                                </select>
                            </td>
                        </tr>
                        <tr>
                            <td align="right">标签名：</td>
                            <td align="center">
                                <select id="markName" style="width: 175px;">
                                    <option value=""></option>
                                </select>
                            </td>
                        </tr>
                    </table>
                </form>
            </div>
            <button id="btn1" style="width: 100px; height: 50px; margin-left: 260px; margin-top: 30px; border: 1px solid transparent;outline: none;">创建</button>
        </div>


    </div>
    <!--	*****************************		-->
    <div id="share">
        <div class="bshare-custom icon-medium-plus" style="font-size: 40px;line-height: 63px !important;">
            <a title="分享到QQ空间" class="bshare-qzone"></a>
            <a title="分享到新浪微博" class="bshare-sinaminiblog"></a>
            <a title="分享到人人网" class="bshare-renren"></a>
            <a title="分享到腾讯微博" class="bshare-qqmb"></a>
            <a title="分享到网易微博" class="bshare-neteasemb"></a>
        </div>
    </div>
</div>
<div id="choose">
    <!--
        作者：offline
        时间：2018-07-18
        描述：对所需选项进行选择
    -->
    <div>
        <ul class="vertical-nav dark red" style="height: 760px;z-index: 2;">
            <li class="active">
                <a href="../UserInformation.html" target="_blank"><i class="icon-user " style="margin: -14.958px 14px 15px -20px;"></i>个人中心</a>
            </li>
            <li class="fristC">
                <a id="newB"  name="0" class="chooseB"><i class="icon-edit " style="margin: 0px 14px 0 -20px;font-size:30px"></i>新建笔记</a>
            </li>
            <li class="fristC">
                <a id="findB" name="0" class="chooseB"><i class="icon-search " style="margin: 0px 14px 0 -20px;font-size:30px"></i>搜索</a>
            </li>
            <li class="fristC">
                <a id="starB" name="0" class="chooseB"><i class="icon-star" style="margin: 0px 14px 0 -20px;font-size:30px"></i>快捷方式</a>
            </li>
            <li class="fristC">
                <a id="notebB" name="0" class="chooseB"><i class="icon-book" style="margin: 0px 14px 0 -20px;font-size:30px"></i>笔记本</a>
            </li>
            <li class="fristC">
                <a id="markB" name="0" class="chooseB"><i class="icon-tags " style="margin: 0px 14px 0 -20px;font-size:30px"></i>标签</a>
            </li>
            <li class="fristC">
                <a id="commentB" name="0" class="chooseB"><i class="icon-comments " style="margin: 0px 14px 0 -20px;font-size:30px"></i>工作群聊</a>
            </li>
            <li class="fristC">
                <a id="trashB" name="0" class="chooseB"><i class="icon-trash" style="margin: 0px 14px 0 -20px;font-size:30px"></i>废纸篓</a>
            </li>
            <li class="fristC">
                <a  id="logoffB"><i class="icon-off " style="margin: 0px 14px 0 -20px;font-size:30px"></i>注销账户</a>
            </li>
        </ul>
    </div>
    <div id="find" class="show">
        <!--
                      作者：offline
                      时间：2018-07-24
                      描述：搜索笔记
                  -->
        <br />

        <h1 class="icon-search">搜索</h1>

        <div id="findinput">
            <form action="#">
                <input id="searchNote" type="text" name="search" placeholder="搜索笔记" />
            </form>
        </div>
        <div id="findul">

        </div>
    </div>
    <div id="star" class="show">
        <!--
            作者：offline
            时间：2018-07-29
            描述：快捷方式
        -->
        <br />
        <h1 class="icon-star">快捷方式</h1>
        <br />
        <br />
        <div id="starul">

        </div>

    </div>

    <div id="noteb" class="show">
        <!--
            作者：offline
            时间：2018-07-27
            描述：笔记本
        -->
        <br />
        <div id="notebTop">

            <h1 class="icon-book">笔记本</h1>

            <i id="newNoteb" class="icon-book " onmouseleave="ntipsHide()" onmouseover="ntipsShow()" onclick="newShowOverlay()">+</i>
            <div id="notebTips">
                <div class="sj">
                </div>
                <p>新建笔记本</p>
            </div>
        </div>
        <div style="text-align: center;">
            <input id="notebSearch" type="text" placeholder="搜索笔记本" />
        </div>
        <div id="notebNum" class="Num">

        </div>
        <div id="notebul">

        </div>

    </div>
    <div id="mark" class="show">
        <!--
            作者：offline
            时间：2018-07-27
            描述：标签
      -->

        <br />
        <div id="markTop">

            <h1 class="icon-tags">标签</h1>

            <i id="newMark" class="icon-tag " onmouseleave="mtipsHide()" onmouseover="mtipsShow()" onclick="markShowOverlay()">+</i>
            <div id="markTips">
                <div class="sj">
                </div>
                <p>添加标签</p>
            </div>
        </div>
        <div style="text-align: center;">
            <input id="markSearch" type="text" placeholder="搜索标签" />
        </div>
        <div id="markNum" class="Num">

        </div>
        <div id="markul">

        </div>

    </div>

    <div id="comment" class="show">
        <!--作者：offline时间：2018-07-19描述：工作群聊-->
        <!--
            作者：903875165@qq.com
            时间：2018-07-22
            描述：工作群聊
        -->
        <br />
        <div id="commentTop">
            <h1 class="icon-comments">工作群聊</h1>
            <i id="newComment" class="icon-comments " onmouseleave="ctipsHide()" onmouseover="ctipsShow()" onclick="newCommentOpen()">+</i>
            <div id="commentTips">
                <div class="sj">
                </div>
                <p>开始群聊</p>
            </div>
        </div>

        <div class="">
            <form action="#" style="text-align: center;">
                <input class="chatInput1" type="text" name="searchChat" placeholder="请输入群聊名称/群聊号码">
                <input class="chatInput2" type="submit" value="搜索">
            </form>
        </div>
        <div id="commentNum" class="Num">

        </div>
        <div id="commentul">
            <div class="starli">
                <div class="starName"><i class="icon-comment"></i>朋友群聊</div>
                <div class="starBtn"><i class="icon-remove notebli_i" title="删除群聊"></i></div>
            </div>
            <div class="starli">
                <div class="starName"><i class="icon-comment"></i>同学群聊</div>
                <div class="starBtn"><i class="icon-remove notebli_i" title="删除群聊"></i></div>
            </div>
            <div class="starli">
                <div class="starName"><i class="icon-comment"></i>老乡群聊</div>
                <div class="starBtn"><i class="icon-remove notebli_i" title="删除群聊"></i></div>
            </div>
            <div class="starli">
                <div class="starName"><i class="icon-comment"></i>朋友群聊</div>
                <div class="starBtn"><i class="icon-remove notebli_i" title="删除群聊"></i></div>
            </div>
            <div class="starli">
                <div class="starName"><i class="icon-comment"></i>同学群聊</div>
                <div class="starBtn"><i class="icon-remove notebli_i" title="删除群聊"></i></div>
            </div>
            <div class="starli">
                <div class="starName"><i class="icon-comment"></i>老乡群聊</div>
                <div class="starBtn"><i class="icon-remove notebli_i" title="删除群聊"></i></div>
            </div>
            <div class="starli">
                <div class="starName"><i class="icon-comment"></i>朋友群聊</div>
                <div class="starBtn"><i class="icon-remove notebli_i" title="删除群聊"></i></div>
            </div>
            <div class="starli">
                <div class="starName"><i class="icon-comment"></i>同学群聊</div>
                <div class="starBtn"><i class="icon-remove notebli_i" title="删除群聊"></i></div>
            </div>
            <div class="starli">
                <div class="starName"><i class="icon-comment"></i>老乡群聊</div>
                <div class="starBtn"><i class="icon-remove notebli_i" title="删除群聊"></i></div>
            </div>
            <div class="starli">
                <div class="starName"><i class="icon-comment"></i>朋友群聊</div>
                <div class="starBtn"><i class="icon-remove notebli_i" title="删除群聊"></i></div>
            </div>
            <div class="starli">
                <div class="starName"><i class="icon-comment"></i>同学群聊</div>
                <div class="starBtn"><i class="icon-remove notebli_i" title="删除群聊"></i></div>
            </div>
            <div class="starli">
                <div class="starName"><i class="icon-comment"></i>老乡群聊</div>
                <div class="starBtn"><i class="icon-remove notebli_i" title="删除群聊"></i></div>
            </div>
            <div class="starli">
                <div class="starName"><i class="icon-comment"></i>朋友群聊</div>
                <div class="starBtn"><i class="icon-remove notebli_i" title="删除群聊"></i></div>
            </div>
            <div class="starli">
                <div class="starName"><i class="icon-comment"></i>同学群聊</div>
                <div class="starBtn"><i class="icon-remove notebli_i" title="删除群聊"></i></div>
            </div>
            <div class="starli">
                <div class="starName"><i class="icon-comment"></i>老乡群聊</div>
                <div class="starBtn"><i class="icon-remove notebli_i" title="删除群聊"></i></div>
            </div>

        </div>

    </div>

    <div id="trash" class="show">
        <!--
            作者：offline
            时间：2018-07-27
            描述：废纸篓
        -->
        <div id="trashtop">
            <br />
            <h1 class="icon-trash">废纸篓</h1>
            <br />
            <div id="cleanTrash" class="chatInput2"><i class="icon-trash"></i><span>&nbsp;清空废纸篓</span></div>
        </div>
        <div id="trashmain">

            <div id="trashNum" class="Num">

            </div>
            <div id="trashSort">

            </div>

        </div>
        <div id="trashul">
        </div>

    </div>

</div>
<div id="notec">
    <!--
        作者：offline
        时间：2018-07-28
        描述：创建笔记本
   -->
    <div class="notecdiv">
        <i class="icon-book" style="font-size: 80px;"></i>
    </div>
    <br />
    <div class="notecdiv" style="line-height: 60px;border-bottom: 1px solid;">
        <p>创建笔记本</p>
    </div>

    <div class="notecdiv">
        <input id="notecdivinput" type="text" placeholder="给笔记本起个名字" />
    </div>
    <div class="notecdiv">
        <input id="notecdivinput_n" type="button" value="取消" onclick="newHideOverlay()" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input id="notecdivinput_y" type="submit" value="创建" onclick="notecIsnull()" />
    </div>
</div>

<div id="markc">
    <!--
        作者：offline
        时间：2018-07-28
        描述：添加标签
    -->
    <div class="notecdiv">
        <i class="icon-tag" style="font-size: 80px;"></i>
    </div>
    <br />
    <div class="notecdiv" style="line-height: 60px;border-bottom: 1px solid;">
        <p>添加标签</p>
    </div>

    <div class="notecdiv">
        <input id="markcdivinput" type="text" placeholder="输入标签名称" />
    </div>
    <div class="notecdiv">
        <input id="markcdivinput_n" type="button" value="取消" onclick="markHideOverlay()" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input id="markcdivinput_y" type="submit" value="添加" onclick="markcIsnull()" />
    </div>
</div>
<div id="commentc">
    <!--
        作者：offline
        时间：2018-07-29
        描述：开始群聊
    -->
    <div id="commentctop">
        <div id="ctl">收件人：</div>
        <div id="cti"><input type="text" placeholder="输入电子邮箱" /></div>
        <div id="ctr"><i class="icon-remove" title="关闭" onclick="newCommentClose()"></i></div>
    </div>
    <div id="commentcmain">

    </div>
    <div id="commentcbottom">
        <form action="#">
            <input id="message" type="text" placeholder="输入消息..." />
            <input id="send" type="submit" value="发送" />
        </form>
    </div>

</div>
</div>
<div id="workPlace">
    <div id="BIJI">
        <h1 id="note" class="icon-paste">笔记</h1>
        <div id="note_below"><span>几条笔记</span></div>
    </div>
    <!--
    <ul id="notelist">

    </ul>
    -->
    <!--	************ADD*****************		-->
    <ul id="notelist">

    </ul>
    <!--弹出层时背景层DIV-->
    <div id="fade" class="black_overlay">
    </div>

    <div id="MyDiv" class="white_content">

        <div style="text-align: right; cursor: default; height: 40px;">
            <span style="font-size: 16px;" onclick="CloseDiv('MyDiv','fade')"><img class="cut" src="../img/5.png"></span>
        </div>

        <div class="delect">
            <div class="delect1"><img src="img/9.png" style="width: 40px; height: 40px;"></div>
            <p>删除笔记</p>
            <div class="delect2"></div>
            <h1>确认删除吗？</h1>

            <div class="delect5">	<input class="cancel" type="button" value="取消">
                <input class="confirm" type="button" value="删除"></div>
        </div>

    </div>
    <!--弹出层时背景层DIV-->
    <div id="fade2" class="black_overlay">
    </div>

    <div id="MyDiv2" class="white_content">

        <div style="text-align: right; cursor: default; height: 40px;">
            <span style="font-size: 16px;" onclick="CloseDiv('MyDiv2','fade2')"><img class="cut" src="../img/5.png"></span>
        </div>
        <div class="delect">
            <div class="delect1"><img src="img/13.png" style="width: 40px; height: 40px;"></div>
            <p>快捷方式</p>
            <div class="delect2"></div>
            <h1>确认添加快捷方式？</h1>

            <div class="delect5">	<input class="cancel" type="button" value="否">
                <input class="confirm" type="button" value="是"></div>
        </div>

    </div>
    <!--弹出层时背景层DIV-->
    <div id="fade3" class="black_overlay">
    </div>

    <div id="MyDiv3" class="white_content">

        <div style="text-align: right; cursor: default; height: 40px;">
            <span style="font-size: 16px;" onclick="CloseDiv('MyDiv3','fade3')"><img class="cut" src="../img/5.png"></span>
        </div>
        <div class="delect1"><img src="../img/12.png" style="width: 40px; height: 40px;"></div>

        <div class="remind"> <input type="button" value="标记完成"></div>
        <div class="remind"> <input type="button" value="清除提醒"></div>
        <div class="remind"> <input type="button" value="通知我"></div>

    </div>
    <!--弹出层时背景层DIV-->
    <div id="fade4" class="black_overlay">
    </div>

    <div id="MyDiv4" class="white_content">

        <div style="text-align: right; cursor: default; height: 40px;">
            <span style="font-size: 16px;" onclick="CloseDiv('MyDiv4','fade4')"><img class="cut" src="../img/5.png"></span>
        </div>
        <div class="delect1"><img src="../img/11.png" style="width: 40px; height: 40px;"></div>
        <div id="MyDiv4_1"><div class="people">收件人：</div> <input type="text" class="man"  maxlength="300" value="电子邮箱"></div>
        <input class="confirm2" type="button" value="发送">
    </div>
</div>
<div id="mainPlace">
    <div id="div1" class="toolbar">
    </div>
    <div style="padding: 5px 0; color: #ccc"></div>
    <div id="div2" class="text" style="height:1200px;width: 850px;max-height:650px;border: 1px solid grey;">
        <p></p>
    </div>
    <button id="btn2" style="background-color: rgb(231, 76, 60); color: #FFFFFF;margin-left: 750px;width: 100px; height: 50px; border: 1px solid transparent;outline: none;">保存</button>


</div>



<div id="overlay"></div>


<script>
    // 目前所写笔记的id
    var NOTE = 0;
    var NOTEBOOK = 1;
    var E = window.wangEditor;
    var editor1 = new E('#div1', '#div2')
    var noteMsg = null;
    var flag = 0;
    editor1.customConfig.uploadImgShowBase64 = true
    editor1.create();


    document.getElementById('btn1').addEventListener('click', function () {
        var noteName = $('#noteName').val();
        var notebookName = $('#notebookName option:selected').val();
        var markName = $('#markName option:selected').val();
        if (noteName == 0) {
            alert('请输入笔记标题')
        } else {
            // 读取 html
            if (notebookName == 0) {
                notebookName = "我的第一个笔记本";
            }

            var json = {getHTML:editor1.txt.html(), noteName:noteName, notebookName:notebookName, markName:markName};
            $.post("${pageContext.request.contextPath}/EditorServlet?method=createNote", json, function(data) {
                $.each(data, function(i, obj) {
                    $("#noteName").val("");
                    $("#notebookName").val("");
                    $("#markName").val("");
                    alert("笔记创建成功")
                    listNote();
                });
                CloseDiv('MyDiv9','fade9');
                changeNote();
            }, 'json');
        }
    }, false);



    document.getElementById('btn2').addEventListener('click', function () {
        // 保存
        $.post("${pageContext.request.contextPath}/EditorServlet?method=saveNote", {getHTML:editor1.txt.html(),noteID:NOTE}, function(data) {
            alert(data);
            changeNote();
        });
    }, false)


    $("#delNoteBtn").on('click', function() {
        $.post("${pageContext.request.contextPath}/EditorServlet?method=delNote", {noteID:NOTE}, function(data) {
            alert(data);
            editor1.txt.clear();
            listNote();
            changeNote();
            CloseDiv('MyDiv8','fade8');
        });
    })

    $("#trashB").on('click', function() {
        // 遍历废纸篓中的笔记
        listNoteInBin();
    })
    function listNoteInBin() {
        // 遍历废纸篓中的笔记
        $.post("${pageContext.request.contextPath}/BinServlet?method=listNoteInBin", {}, function(data) {
            $("#trashul").html("");
            $.each(data, function(i, o) {
                $.each(o, function(j, obj) {
                    if (obj.title != undefined) {
                        // 笔记
                        var div = "            <div class=\"trashli\" id=\"noteInBin"+obj.id+"\">\n" +
                            "                <div class=\"trashName\"><i class=\"icon-file\"></i>"+obj.title+"</div>\n" +
                            "                <div class=\"trashBtn\"><i class=\"icon-undo notebli_i\" title=\"还原\"></i><i class=\"icon-trash notebli_i trashi\" title=\"彻底删除\"></i></div>\n" +
                            "            </div>"
                        $("#trashul").append(div);
                    } else if (obj.markName != undefined) {
                        // 标签
                        var div = "            <div class=\"trashli\" id=\"markInBin"+obj.id+"\">\n" +
                            "                <div class=\"trashName\"><i class=\"icon-tag\"></i>"+obj.markName+"</div>\n" +
                            "                <div class=\"trashBtn\"><i class=\"icon-undo notebli_i\" title=\"还原\"></i><i class=\"icon-trash notebli_i trashi\" title=\"彻底删除\"></i></div>\n" +
                            "            </div>"
                        $("#trashul").append(div);
                    } else {
                        // 笔记本
                        var div = "            <div class=\"trashli\" id=\"notebookInBin"+obj.id+"\">\n" +
                            "                <div class=\"trashName\"><i class=\"icon-book\"></i>"+obj.bookName+"</div>\n" +
                            "                <div class=\"trashBtn\"><i class=\"icon-undo notebli_i\" title=\"还原\"></i><i class=\"icon-trash notebli_i trashi\" title=\"彻底删除\"></i></div>\n" +
                            "            </div>"
                        $("#trashul").append(div);
                    }

                });
            })
            btnAnimation();
        }, 'json');
    }

    $(document).on('click', '.trashi', function() {
        if (this.parentNode.parentNode.id.search('book') != -1) {
            // 笔记本
            var notebookInBinID = this.parentNode.parentNode.id.slice(13);
            $.post("${pageContext.request.contextPath}/BinServlet?method=removeNotebookInBin", {notebookInBinID:notebookInBinID}, function(data) {
                alert(data)
                listNoteInBin();
            })
        } else if (this.parentNode.parentNode.id.search('mark') != -1) {
            //  标签
            var markInBin = this.parentNode.parentNode.id.slice(9);
            $.post("${pageContext.request.contextPath}/BinServlet?method=removeMarkInBin", {markInBin:markInBin}, function(data) {
                alert(data)
                listNoteInBin();
            })
        } else {
            // 笔记
            var noteInBinID = this.parentNode.parentNode.id.slice(9);
            $.post("${pageContext.request.contextPath}/BinServlet?method=removeNoteInBin", {noteIDInBin:noteInBinID}, function(data) {
                alert(data)
                listNoteInBin();
            })
        }
    })

    $(document).on('click', '.icon-undo', function() {
        if (this.parentNode.parentNode.id.search('book') != -1) {
            // 笔记本
            var notebookInBinID = this.parentNode.parentNode.id.slice(13);
            $.post("${pageContext.request.contextPath}/BinServlet?method=RecoverNotebookInBin", {notebookIDInBin:notebookInBinID}, function(data) {
                alert(data)
                listNoteInBin();
                listNote();
            })
        }else if (this.parentNode.parentNode.id.search('mark') != -1) {
            //  标签
            var markInBin = this.parentNode.parentNode.id.slice(9);
            $.post("${pageContext.request.contextPath}/BinServlet?method=RecoverMarkInBin", {markInBin:markInBin}, function(data) {
                alert(data)
                listNoteInBin();
            })
        } else {
            // 笔记
            var noteInBinID = this.parentNode.parentNode.id.slice(9);
            $.post("${pageContext.request.contextPath}/BinServlet?method=RecoverNoteInBin", {noteIDInBin:noteInBinID}, function(data) {
                alert(data)
                listNoteInBin();
                listNote();
            })
        }

    })
    $("#cleanTrash").click(function() { //确认是否清空废纸篓
        var x=confirm("是否清空废纸篓？");
        if(x) {
            $.post("${pageContext.request.contextPath}/BinServlet?method=clearNoteInBin", {}, function(data) {
                listNoteInBin();
                alert(data);
            })
        }
    });

    function changeNote() {
        var notes = document.getElementById('notelist').getElementsByClassName('biji');
        for (var i=0; i<notes.length; i++) {
            notes[i].addEventListener('click', function() {
                var noteID = this.id.slice(4);
                NOTE = noteID;
                $.post("${pageContext.request.contextPath}/EditorServlet?method=findContent", {noteID:noteID}, function(data) {
                    $.each(data, function(i, obj) {
                        // editor.txt.html(obj.content)
                        editor1.txt.html(obj.content)
                        noteMsg = obj;
                    });
                }, 'json')
            }, false)
        }
    }

    $("#notebB").on('click', function() {
        listNotebook();
    })


    function init() {
        btnAnimation();
        createNotebook();
        delNotebook();
        listNote();
        markNotebook();
        createMark();
        markTag();
        searchNote();

    }
    function listNote() {
        // 将所有笔记部署到页面上
        $.post("${pageContext.request.contextPath}/EditorServlet?method=listNote", {notebookID:NOTEBOOK}, function(data) {
            $("#notelist").html("");
            $.each(data, function(i, obj) {
                var divs = "\t\t\t<div class=\"biji\" id=\"note"+obj.id+"\">\n" +
                    "                    <div class=\"h1\"><span>"+obj.title+"</span></div>\n" +
                    "                    <div class=\"p1\"><span>"+obj.content.substr(0, 10)+"</span></div>\n" +
                    "                    <div class=\"img1\" onclick=\"ShowDiv('MyDiv','fade')\" style=\"width: 32px; height: 32px;\"><img src=\"../img/4.png\" style=\"width: 20px; height: 20px;\"></div>\n" +
                    "                    <div class=\"img1\" onclick=\"ShowDiv('MyDiv2','fade2')\" style=\"width: 32px; height: 32px;\"><img src=\"../img/3.png\" style=\"width: 20px; height: 20px;\"></div>\n" +
                    "                    <div class=\"img1\" onclick=\"ShowDiv('MyDiv3','fade3')\" style=\"width: 32px; height: 32px;\"><img src=\"../img/2.png\" style=\"width: 22px; height: 22px;\"></div>\n" +
                    "                    <div class=\"img1\" onclick=\"ShowDiv('MyDiv4','fade4')\" style=\"width: 32px; height: 32px;\"><img src=\"../img/1.png\" style=\"width: 21px; height: 21px;\"></div>\n" +
                    "\t\t\t</div>";
                var li = "<li class=\"biji\" id=\"note"+obj.id+"\">\n" +
                    "            "+obj.title+"\n" +
                    "        </li>"
                $("#notelist").append(divs);
                NOTE = obj.id;
            });
            editor1.txt.html("");
            changeNote();
        }, 'json');
    }

    function listNotebook() {
        $.post("${pageContext.request.contextPath}/NotebookServlet?method=listNotebook", {}, function(data) {
            $("#notebul").html("");
            $.each(data, function(i, obj) {
                if (obj.isStart == 1) {
                    var div = "<div class=\"notebli notebookLi\" id=\"notebook"+obj.id+"\">\n" +
                        "<div class=\"notebliBook\"><i class=\"icon-book\"></i>"+obj.bookName+"</div>\n" +
                        "<div class=\"notebliBtn\"><i title=\"修改名称\" class=\"icon-magic notebli_i\"></i><i title=\"添加/（删除）快捷方式\" class=\"icon-star-empty notebli_i markNotebook icon-star \"></i><i title=\"删除笔记本\" class=\"icon-trash notebli_i delNotebook\"></i></div>\n" +
                        "</div>";
                } else {
                    var div = "<div class=\"notebli notebookLi\" id=\"notebook"+obj.id+"\">\n" +
                        "<div class=\"notebliBook\"><i class=\"icon-book\"></i>"+obj.bookName+"</div>\n" +
                        "<div class=\"notebliBtn\"><i title=\"修改名称\" class=\"icon-magic notebli_i\"></i><i title=\"添加/（删除）快捷方式\" class=\"icon-star-empty notebli_i markNotebook \"></i><i title=\"删除笔记本\" class=\"icon-trash notebli_i delNotebook\"></i></div>\n" +
                        "</div>";
                }
                $("#notebul").append(div);
            });
            btnAnimation();
        }, 'json');
    }

    function markNotebook() {
        $(document).on('click', '.markNotebook', function() {
            if (this.className.split(' ').length == 4) {
                // 没有被标记
                var notebookID = this.parentNode.parentNode.id.slice(8);
                $.post("${pageContext.request.contextPath}/NotebookServlet?method=markNotebook", {notebookID:notebookID}, function(data) {
                    listNotebook();
                });
            } else {
                // 已经被标记
                var notebookID = this.parentNode.parentNode.id.slice(8);
                $.post("${pageContext.request.contextPath}/NotebookServlet?method=unMarkNotebook", {notebookID:notebookID}, function(data) {
                    listNotebook();
                });
            }
        })
    }

    function markTag() {
        $(document).on('click', '.markTag', function() {
            if (this.className.split(' ').length == 3) {
                // 没有被标记
                var markID = this.parentNode.parentNode.id.slice(4);
                $.post("${pageContext.request.contextPath}/MarkServlet?method=markTag", {markID:markID}, function(data) {
                    listMark();
                });

            } else {
                // 已经被标记
                var markID = this.parentNode.parentNode.id.slice(4);
                $.post("${pageContext.request.contextPath}/MarkServlet?method=unMarkTag", {markID:markID}, function(data) {
                    listMark();
                });
            }
        })
    }

    function createNotebook() {
        $("#notecdivinput_y").on('click', function() {
            var bookName = $("#notecdivinput").val();
            $.post("${pageContext.request.contextPath}/NotebookServlet?method=createNotebook", {bookName:bookName}, function(data) {
                listNotebook();
            })
        });
    }

    function delNotebook() {
        $(document).on('click', '.delNotebook', function() {
            var notebookID = this.parentNode.parentNode.id.slice(8);
            $.post("${pageContext.request.contextPath}/NotebookServlet?method=delNotebook", {notebookID:notebookID}, function(data) {
                alert(data);
                listNotebook();
            });
        })
    }

    function createMark() {
        $("#markcdivinput_y").on('click', function() {
            var markName = $('#markcdivinput').val();
            $.post("${pageContext.request.contextPath}/MarkServlet?method=createMark", {markName:markName}, function(data) {
                listMark();
            })
        })
    }

    $(document).on('click', ".delMark", function() {
        var markID = this.parentNode.parentNode.id.slice(4)
        $.post("${pageContext.request.contextPath}/MarkServlet?method=delMark", {markID:markID}, function(data) {
            alert(data)
            listMark()
        })
    });

    $("#markB").on('click', function() {
        listMark();
    })

    $(document).on('click', '.markDiv', function() {
        var markID = this.id.slice(4);
        listNoteByMark(markID);
    })


    function listNoteByMark(markID) {
        $.post("${pageContext.request.contextPath}/MarkServlet?method=listNoteByMark", {markID:markID}, function(data) {
            if (data == "") {
                alert("该标签下没有笔记")
            } else {
                $("#notelist").html("");
                $.each(data, function(i, obj) {
                    var divs = "\t\t\t<div class=\"biji\" id=\"note"+obj.id+"\">\n" +
                        "                    <div class=\"h1\"><span>"+obj.title+"</span></div>\n" +
                        "                    <div class=\"p1\"><span>"+obj.content.substr(0, 10)+"</span></div>\n" +
                        "                    <div class=\"img1\" onclick=\"ShowDiv('MyDiv','fade')\" style=\"width: 32px; height: 32px;\"><img src=\"../img/4.png\" style=\"width: 20px; height: 20px;\"></div>\n" +
                        "                    <div class=\"img1\" onclick=\"ShowDiv('MyDiv2','fade2')\" style=\"width: 32px; height: 32px;\"><img src=\"../img/3.png\" style=\"width: 20px; height: 20px;\"></div>\n" +
                        "                    <div class=\"img1\" onclick=\"ShowDiv('MyDiv3','fade3')\" style=\"width: 32px; height: 32px;\"><img src=\"../img/2.png\" style=\"width: 22px; height: 22px;\"></div>\n" +
                        "                    <div class=\"img1\" onclick=\"ShowDiv('MyDiv4','fade4')\" style=\"width: 32px; height: 32px;\"><img src=\"../img/1.png\" style=\"width: 21px; height: 21px;\"></div>\n" +
                        "\t\t\t</div>";
                    var li = "<li class=\"biji\" id=\"note"+obj.id+"\">\n" +
                        "            "+obj.title+"\n" +
                        "        </li>"
                    $("#notelist").append(divs);
                });
                editor1.txt.html("");
                changeNote();
            }
        }, 'json');
    }


    function listMark() {
        $.post("${pageContext.request.contextPath}/MarkServlet?method=listMark", {}, function(data) {
            $("#markul").html("");
            $.each(data, function(i, obj) {
                if (obj.isStart == 1) {
                    var div = "<div class=\"notebli markDiv\" id=\"mark"+obj.id+"\">\n" +
                        "<div class=\"markli\"><i class=\"icon-tag\"></i>"+obj.markName+"</div>\n" +
                        "<div class=\"notebliBtn\">\n" +
                        "<a name=\"0\" title=\"修改标签名\" class=\"icon-pencil notebli_i\"></a><i title=\"添加/（删除）快捷方式\" class=\"icon-star-empty notebli_i markTag icon-star \"></i><i title=\"删除标签\" class=\"icon-trash notebli_i delMark\"></i></div>\n" +
                        "</div>";
                    $("#markul").append(div);
                } else {
                    var div = "<div class=\"notebli markDiv\" id=\"mark"+obj.id+"\">\n" +
                        "<div class=\"markli\"><i class=\"icon-tag\"></i>"+obj.markName+"</div>\n" +
                        "<div class=\"notebliBtn\">\n" +
                        "<a name=\"0\" title=\"修改标签名\" class=\"icon-pencil notebli_i\"></a><i title=\"添加/（删除）快捷方式\" class=\"icon-star-empty notebli_i markTag\"></i><i title=\"删除标签\" class=\"icon-trash notebli_i delMark\"></i></div>\n" +
                        "</div>";
                    $("#markul").append(div);
                }
            })
            btnAnimation();
        }, 'json')
    }

    $.post("${pageContext.request.contextPath}/MarkServlet?method=listMark", {}, function(data) {
        $("#markName").html("<option value=\"\"></option>");
        $.each(data, function(i, obj) {
            var option = "<option value=\""+obj.markName+"\">"+obj.markName+"</option>";
            $("#markName").append(option);
        })
    }, 'json')

    $.post("${pageContext.request.contextPath}/NotebookServlet?method=listNotebook", {}, function(data) {
        $.each(data, function(i, obj) {
            var option = "<option value=\""+obj.bookName+"\">"+obj.bookName+"</option>";
            $("#notebookName").append(option);
        })
    }, 'json')

    $(document).on('click', '.notebookLi', function() {
        NOTEBOOK = this.id.slice(8);
        listNote();
    })


    function searchNote() {
        document.getElementById('searchNote').onkeyup = function() {
            var keyword = $("#searchNote").val();
            if (keyword != "") {
                $.post("${pageContext.request.contextPath}/NoteServlet?method=searchNote", {keyword:keyword}, function(data) {
                    if (data.length != 0) {
                        $("#findul").html("");
                        $.each(data, function(i, obj) {
                            var div = "<div class=\"starli\" \">\n" +
                                "<div><i class=\"icon-file\"></i>"+obj.title+"</div>\n" +
                                "</div>";
                            $("#findul").append(div)
                        })
                        btnAnimation();
                    } else {
                        $("#findul").html("");
                    }
                }, 'json')
            } else {
                $("#findul").html("");
            }
        }
    }





    $("#starB").on('click', function() {
        listStar()
    })

    function listStar() {
        $.post("${pageContext.request.contextPath}/StarServlet?method=listStar", {}, function(data) {
            $("#starul").html("");
            $.each(data, function(i, o) {
                $.each(o, function(j, obj) {
                    if (obj.markName != undefined) {
                        var div = "<div class=\"starli starDiv\" id=\"markStared"+obj.id+"\">\n" +
                            "<div class=\"starName\"><i class=\"icon-tag\"></i>"+obj.markName+"</div>\n" +
                            "<div class=\"starBtn\"><i class=\"icon-minus-sign notebli_i\" title=\"删除快捷方式\"></i></div>\n" +
                            "</div>";
                        $("#starul").append(div);
                    } else if (obj.bookName != undefined) {
                        var div = "<div class=\"starli starDiv\" id=\"notebookStared"+obj.id+"\">\n" +
                            "<div class=\"starName\"><i class=\"icon-book\"></i>"+obj.bookName+"</div>\n" +
                            "<div class=\"starBtn\"><i class=\"icon-minus-sign notebli_i\" title=\"删除快捷方式\"></i></div>\n" +
                            "</div>";
                        $("#starul").append(div);
                    } else {
                        var div = "<div class=\"starli starDiv\" id=\"noteStared"+obj.id+"\">\n" +
                            "<div class=\"starName\"><i class=\"icon-file\"></i>"+obj.title+"</div>\n" +
                            "<div class=\"starBtn\"><i class=\"icon-minus-sign notebli_i\" title=\"删除快捷方式\"></i></div>\n" +
                            "</div>";
                        $("#starul").append(div);
                    }
                })
            })
            btnAnimation();
        }, 'json')
    }

    $(document).on('click', '.starDiv', function() {
        var id = this.id;
        if (id.search('book') != -1) {
            // 笔记本
            id = id.slice(14)
            NOTEBOOK = id;
            listNote();
        } else if (id.search('mark') != -1) {
            // 标签
            id = id.slice(10);
            listNoteByMark(id);
        } else {
            // 笔记
            id = id.slice(10);
            NOTE = id;
            $.post("${pageContext.request.contextPath}/EditorServlet?method=findContent", {noteID:id}, function(data) {
                $.each(data, function(i, obj) {
                    // editor.txt.html(obj.content)
                    editor1.txt.html(obj.content)
                });
            }, 'json')
        }
    })


    $("#starNoteBtn").on('click', function() {
        var noteID = NOTE;
        starNote(noteID);
    })

    function starNote(noteID) {
        $.post("${pageContext.request.contextPath}/NoteServlet?method=starNote", {noteID:noteID}, function(data) {
            alert(data);
        });
    }

    $(document).on('click', '.starBtn', function() {
        var id = this.parentNode.id;
        if (id.search('book') != -1) {
            // 笔记本
            id = id.slice(14)
            $.post("${pageContext.request.contextPath}/NotebookServlet?method=unMarkNotebook", {notebookID:id}, function(data) {
                listStar();
            })
        } else if (id.search('mark') != -1) {
            // 标签
            id = id.slice(10);
            $.post("${pageContext.request.contextPath}/MarkServlet?method=unMarkTag", {markID:id}, function(data) {
                listStar();
            })
        } else {
            // 笔记
            id = id.slice(10);
            $.post("${pageContext.request.contextPath}/NoteServlet?method=unStarNote", {noteID:id}, function(data) {
                listStar();
            })
        }
    })

    $("#msgBtn").on('click', function() {
        if (noteMsg == null) {
            alert('请选中笔记');
        } else {

            ShowDiv('MyDiv7','fade7');
            $('#NoteMsg').html("");
            $.post("${pageContext.request.contextPath}/EditorServlet?method=findContent", {noteID:NOTE}, function(data) {
                $.each(data, function(i, obj) {
                    var table = "<table style=\"margin-left:220px; margin-top:100px;\">\n" +
                        "                        <tr>\n" +
                        "                            <td>标题</td>\n" +
                        "                            <td>"+obj.title+"</td>\n" +
                        "                        </tr>\n" +
                        "                        <tr>\n" +
                        "                            <td>创建时间</td>\n" +
                        "                            <td>"+new Date(obj.createTime)+"</td>\n" +
                        "                        </tr>\n" +
                        "                        <tr>\n" +
                        "                            <td>更新时间</td>\n" +
                        "                            <td>"+new Date(obj.updateTime)+"</td>\n" +
                        "                        </tr>\n" +
                        "                        <tr>\n" +
                        "                            <td>标签名</td>\n" +
                        "                            <td>"+obj.markName+"</td>\n" +
                        "                        </tr>\n" +
                        "                        <tr>\n" +
                        "                            <td>笔记本</td>\n" +
                        "                            <td>"+obj.bookName+"</td>\n" +
                        "                        </tr>\n" +
                        "                    </table>";
                    $('#NoteMsg').append(table)
                })
            }, 'json')
        }
    })

    $("#newB").click(function() {
        if (flag == 0) {
            ShowDiv('MyDiv9','fade9');
            editor1.txt.html("");
            flag = 1;
        } else {
            flag = 0;
        }

    })


    //点击注销账户进行询问并链接到登录页面
    $("#logoffB").click(function() {
        var isLogoff = confirm("是否退出当前用户？");
        if(isLogoff) {
            window.self.location = "${pageContext.request.contextPath}/UserServlet?method=logOut";
        }
    });


    function btnAnimation() {
        //显示条数
        {
            document.getElementById("trashNum").innerHTML = $(".trashName").children('i.icon-file').length + "条笔记;" + $(".trashName").children('i.icon-tag').length + "条标签;" + $(".trashName").children('i.icon-book').length + "本笔记本";
            document.getElementById("commentNum").innerHTML = $("#commentul").children('div.starli').length + "个群聊";
            document.getElementById("markNum").innerHTML = $("#markul").children('div.notebli').length + "条标签";
            document.getElementById("notebNum").innerHTML = $("#notebul").children('div.notebli').length + "本笔记本";
        }
        //鼠标悬浮按钮出现
        $(".notebli").mouseover(function() {
            $(this).children('div.notebliBtn').show();
        });
        //鼠标离开按钮隐藏
        $(".notebli").mouseleave(function() {
            $(this).children('div.notebliBtn').hide();

        });
        //鼠标悬浮star按钮出现
        $(".starli").mouseover(function() {
            $(this).children('div.starBtn').show();
        });
        //鼠标离开按钮star隐藏
        $(".starli").mouseleave(function() {
            $(this).children('div.starBtn').hide();
        });

        //鼠标悬浮trash按钮出现
        $(".trashli").mouseover(function() {
            $(this).children('div.trashBtn').show();
        });
        //鼠标离开按钮trash隐藏
        $(".trashli").mouseleave(function() {
            $(this).children('div.trashBtn').hide();
        });

    }
</script>

</body>

</html>