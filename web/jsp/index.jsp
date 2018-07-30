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
                    <a href="../UserInformation.html" target="_blank"><i class="icon-user " style="margin: -14.958px 14px 15px -20px;"></i>个人用户</a>
                </li>
                <li class="fristC">
                    <a id="newB" name="0" class="chooseB"><i class="icon-edit " style="margin: 0px 14px 0 -20px;font-size:30px"></i>新建笔记</a>
                </li>
                <li class="fristC">
                    <a id="findB" name="0" class="chooseB"><i class="icon-search " style="margin: 0px 14px 0 -20px;font-size:30px"></i>搜索笔记</a>
                </li>
                <li class="fristC">
                    <a id="notebB" name="0" class="chooseB"><i class="icon-th-list" style="margin: 0px 14px 0 -20px;font-size:30px"></i>笔记本</a>
                </li>
                <li class="fristC">
                    <a id="markB" name="0" class="chooseB"><i class="icon-tags " style="margin: 0px 14px 0 -20px;font-size:30px"></i>标签分类</a>
                </li>
                <li class="fristC">
                    <a id="commentB" name="0" class="chooseB"><i class="icon-comments " style="margin: 0px 14px 0 -20px;font-size:30px"></i>工作群聊</a>
                </li>
                <li class="fristC">
                    <a id="trashB" name="0" class="chooseB"><i class="icon-trash" style="margin: 0px 14px 0 -20px;font-size:30px"></i>废纸篓</a>
                </li>
                <li class="fristC">
                    <a href="${pageContext.request.contextPath}/UserServlet?method=logOut" id="logoffB"><i class="icon-off " style="margin: 0px 14px 0 -20px;font-size:30px"></i>注销账户</a>
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
        <h1 class="icon-search">搜索笔记</h1>

        <div class="findChat">
            <input id="workInput" class="chatInput1" type="text" name="search" placeholder="请输入关键字">
            <input class="chatInput2" id="searchNote" type="button" value="搜索" />
        </div>
        <div id="searchNoteRes"></div>
    </div>

    <div id="noteb" class="show">
        <!--
            作者：offline
            时间：2018-07-27
            描述：笔记本
        -->
        <br />
        <h1 class="icon-th-list">笔记本</h1>

    </div>
    <div id="mark" class="show">
        <!--
            作者：offline
            时间：2018-07-27
            描述：标签分类
        -->
        <br />
        <h1 class="icon-tags">标签分类</h1>

    </div>

    <div id="comment" class="show">
        <!--作者：offline时间：2018-07-19描述：工作群聊-->
        <!--
            作者：903875165@qq.com
            时间：2018-07-22
            描述：点击出现。
        -->
        <br />
        <h1 class="icon-comments">工作群聊</h1>
        <div class="findChat">
            <input class="chatInput1" type="text" name="searchChat" placeholder="请输入群聊名称/群聊号码">
            <input class="chatInput2" type="button" value="搜索">
        </div>
        <div id="chat">
            <ul>
                <li>群聊1</li>
                <li>群聊2</li>
                <li>群聊3</li>
                <li>群聊4</li>
                <li>群聊5</li>
            </ul>
        </div>
        <div class="newChat"><i class="icon-plus"></i><span>&nbsp;新建群聊</span></div>

    </div>

    <div id="trash" class="show">
        <!--
            作者：offline
            时间：2018-07-27
            描述：废纸篓
        -->
        <br />
        <h1 class="icon-trash">废纸篓</h1>
        <ul id="note-in-bin"></ul>
        <div id="cleanTrash" class="newChat"><i class="icon-trash"></i><span>&nbsp;清空废纸篓</span></div>

    </div>

</div>
<div id="workPlace">
    <div id="BIJI"><p id="note">笔记</p></div>
    <ul id="notelist">

    </ul>
</div>
<div id="mainPlace">
    <div id="div1" class="toolbar">
    </div>
    <div style="padding: 5px 0; color: #ccc"></div>
    <div id="div2" class="text" style="height:700px;width: 920px;max-height:500px;border: 1px solid grey;">
        <p></p>
    </div>
    <button id="btn1">创建</button>
    <button id="btn2">保存</button>
    <button id="btn3">删除</button>
</div>

<!-- 各种弹出窗口 -->
<div id="createNotebookPop">
        <h2>新建笔记本</h2>
        笔记本名字：<input name="bookName" id="bookName" type="text"><br>
        <input type="button" id="createNotebookPopSub" value="确认">
    <span class="createNotebookPopSpan"></span>
</div>

<script>
    // 目前所写笔记的id
    var NOTE = 0;
    var E = window.wangEditor;
    var editor1 = new E('#div1', '#div2')
    editor1.customConfig.uploadImgShowBase64 = true
    editor1.create();

    document.getElementById('btn1').addEventListener('click', function () {
        // 读取 html
        $.post("${pageContext.request.contextPath}/EditorServlet?method=createNote", {getHTML:editor1.txt.html()}, function(data) {
            $.each(data, function(i, obj) {
                alert("笔记创建成功")
                listNote();
            });
            changeNote();
        }, 'json');
    }, false);

    document.getElementById('createNotebookPopSub').addEventListener('click', function () {
        var bookName = document.getElementById('bookName').value;
        $.post("${pageContext.request.contextPath}/NotebookServlet?method=createNotebook", {"bookName":bookName}, function(data) {
            $("#createNotebookPop").css("display", "none")
            $.each(data, function(i, obj) {
                var li = "<li class=\"sceondC\">\n" +
                    "       <a href=\"#\">"+obj.bookName+"<span class=\"submenu-icon\"></span></a>\n" +
                    "       <ul>\n" +
                    "          <li>\n" +
                    "              <a href=\"#\">编辑</a>\n" +
                    "          </li>\n" +
                    "          <li>\n" +
                    "               <a href=\"#\">添加标签</a>\n" +
                    "          </li>\n" +
                    "          <li>\n" +
                    "               <a href=\"#\">共享\n" +
                    "               </a>\n" +
                    "          </li>\n" +
                    "          <li>\n" +
                    "               <a href=\"#\" onclick=\"deleteNotebook()\">删除</a>\n" +
                    "          </li>\n" +
                    "        </ul>\n" +
                    "      </li>";
                $('#notebook').append(li);
            });

            alert("创建成功！")
        }, 'json');
    }, false)


    document.getElementById('btn2').addEventListener('click', function () {
        // 保存
        $.post("${pageContext.request.contextPath}/EditorServlet?method=saveNote", {getHTML:editor1.txt.html(),noteID:NOTE}, function(data) {
            alert(data);
            changeNote();
        });
    }, false)

    document.getElementById('btn3').addEventListener('click', function () {
        // 删除
        $.post("${pageContext.request.contextPath}/EditorServlet?method=delNote", {noteID:NOTE}, function(data) {
            alert(data);
            editor1.txt.clear();
            listNote();
            changeNote();
        });
    }, false)

    $("#trashB").on('click', function() {
        // 遍历废纸篓中的笔记
        listNoteInBin();
    })
    function listNoteInBin() {
            // 遍历废纸篓中的笔记
            $.post("${pageContext.request.contextPath}/BinServlet?method=listNoteInBin", {}, function(data) {
                $("#note-in-bin").html("");
                $.each(data, function(i, obj) {
                    var li = "<li id=\"noteInBin"+obj.id+"\"><i class=\"icon-file filei\"></i><span>"+obj.title+"</span><i class=\"icon-trash trashi both\"></i><i class=\"icon-undo both\"></i></li>";
                    $("#note-in-bin").append(li);
                });
            }, 'json');
    }

    $(document).on('click', '.trashi', function() {
        var noteInBinID = this.parentNode.id.slice(9);
        $.post("${pageContext.request.contextPath}/BinServlet?method=removeNoteInBin", {noteIDInBin:noteInBinID}, function(data) {
            alert(data)
            listNoteInBin();
        })
    })

    $(document).on('click', '.icon-undo', function() {
        var noteInBinID = this.parentNode.id.slice(9);
        $.post("${pageContext.request.contextPath}/BinServlet?method=RecoverNoteInBin", {noteIDInBin:noteInBinID}, function(data) {
            alert(data)
            listNoteInBin();
            listNote();
        })
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
        var notes = document.getElementById('notelist').getElementsByTagName("li");
        for (var i=0; i<notes.length; i++) {
            notes[i].addEventListener('click', function() {
                var noteID = this.id.slice(4);
                NOTE = noteID;
                $.post("${pageContext.request.contextPath}/EditorServlet?method=findContent", {noteID:noteID}, function(data) {
                    $.each(data, function(i, obj) {
                        // editor.txt.html(obj.content)
                        editor1.txt.html(obj.content)
                    });
                }, 'json')
            }, false)
        }
    }



    function init() {
        /*
        $.post("/NotebookServlet?method=listNotebook", {}, function(data) {
            $.each(data, function(i, obj) {
                var li = "<li class=\"sceondC\">\n" +
                    "       <a href=\"#\">"+obj.bookName+"<span class=\"submenu-icon\"></span></a>\n" +
                    "       <ul>\n" +
                    "          <li>\n" +
                    "              <a href=\"#\">编辑</a>\n" +
                    "          </li>\n" +
                    "          <li>\n" +
                    "               <a href=\"#\">添加标签</a>\n" +
                    "          </li>\n" +
                    "          <li>\n" +
                    "               <a href=\"#\">共享\n" +
                    "               </a>\n" +
                    "          </li>\n" +
                    "          <li>\n" +
                    "               <a href=\"#\" onclick=\"deleteNotebook()\">删除</a>\n" +
                    "          </li>\n" +
                    "        </ul>\n" +
                    "      </li>";
                $('#notebook').append(li);
            });
            changeNote();
        }, 'json');
        */
        listNote();
        searchNote();

    }
    function listNote() {
        // 将所有笔记部署到页面上
        $.post("${pageContext.request.contextPath}/EditorServlet?method=listNote", {}, function(data) {
            $("#notelist").html("");
            $.each(data, function(i, obj) {
                var li = "<li class=\"biji\" id=\"note"+obj.id+"\">\n" +
                    "            "+obj.title+"\n" +
                    "        </li>"
                $("#notelist").append(li);
                NOTE = obj.id;
            });
            changeNote();
        }, 'json');
    }

    function searchNote() {
        $("#searchNote").on('click', function() {
            var keyword = $("#workInput").val();
            $.post("${pageContext.request.contextPath}/NoteServlet?method=searchNote", {keyword:keyword}, function(data) {
                $("#searchNoteRes").html("");
                $.each(data, function(i, obj) {
                    var li = "<li id=\"noteAfterSearch"+obj.id+"\"><i class=\"icon-file filei\"></i><span>"+obj.title+"</span><i class=\"icon-trash trashi both\"></i><i class=\"icon-undo both\"></i></li>";
                    $("#searchNoteRes").append(li);
                });
            }, 'json')
        })
    }



    function deleteNotebook() {
        var notebookId = $("#1")


    }
</script>
</body>

</html>