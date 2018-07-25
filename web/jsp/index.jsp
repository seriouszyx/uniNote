<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>

<head>
    <meta charset="utf-8" />
    <title>HelloNote</title>
</head>
<link href="../css/style.css" rel="stylesheet">
<link href="../css/font-awesome.css" rel="stylesheet">
<link href="../css/new.css" rel="stylesheet">
<script type="text/javascript" src="../js/jquery-1.10.1.min.js"></script>
<script src="http://tjs.sjs.sinajs.cn/open/api/js/wb.js" type="text/javascript" charset="utf-8"></script>
<script type="text/javascript" src="http://widget.renren.com/js/rrshare.js"></script>
<script type="text/javascript" src="../js/style.js"></script>
<script type="text/javascript" src="../js/index.js"></script>
<script type="text/javascript" charset="utf-8" src="http://static.bshare.cn/b/buttonLite.js#style=-1&amp;uuid=&amp;pophcol=2&amp;lang=zh"></script>
<script type="text/javascript" charset="utf-8" src="http://static.bshare.cn/b/bshareC0.js"></script>
<script type="text/javascript" src="../js/google-maps.js"></script>
<script type="text/javascript" src="../wangEditor-3.1.1/release/wangEditor.min.js"></script>

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
    <div class="kePublic">
        <div class="content">
            <ul class="vertical-nav dark red" style="height: 760px;z-index: 2;">
                <li class="active">
                    <a href="UserInformation.html" target="_blank"><i class="icon-user " style="margin: -14.958px 14px 15px -20px;"></i>个人中心</a>
                </li>
                <li class="fristC">
                    <a href="#"><i class="icon-edit " style="margin: 0px 14px 0 -20px;font-size:30px"></i>新建笔记
                    </a>
                </li>
                <li class="fristC">
                    <a id="find"><i class="icon-search " style="margin: 0px 14px 0 -20px;font-size:30px"></i>搜索笔记</a>
                </li>
                <li class="fristC">
                    <a href="#"><i class="icon-th-list" style="margin: 0px 14px 0 -20px;font-size:30px"></i>笔记本
                        <span class="submenu-icon " style="line-height: 48px;"></span></a>
                    <ul id="notebook">
                        <li class="sceondC">
                            <a href="#" id="createNotebook">新建笔记本<span class="submenu-icon"></span></a>
                        </li>
                        <li class="sceondC">
                            <a id="1" href="#">我的第一个笔记本<span class="submenu-icon"></span></a>
                            <ul>
                                <li>
                                    <a href="#">编辑</a>
                                </li>
                                <li>
                                    <a href="#">添加标签</a>
                                </li>
                                <li>
                                    <a href="#">共享
                                    </a>
                                </li>
                                <li>
                                    <a href="#" onclick="deleteNote()">删除</a>
                                </li>
                            </ul>
                        </li>

                    </ul>
                </li>
                <li class="fristC">
                    <a href="#"><i class="icon-tags " style="margin: 0px 14px 0 -20px;font-size:30px"></i>标签分类<span class="submenu-icon " style="line-height: 48px;"></span></a>
                    <ul>
                        <li class="sceondC">
                            <a href="#">分类1<span class="submenu-icon "></span></a>
                            <ul>
                                <li>
                                    <a href="#">查看笔记</a>
                                </li>
                                <li>
                                    <a href="#">删除分类</a>

                                </li>

                            </ul>
                        </li>
                        <li class="sceondC">
                            <a href="#">分类2<span class="submenu-icon "></span></a>
                            <ul>
                                <li>
                                    <a href="#">查看笔记</a>
                                </li>
                                <li>
                                    <a href="#">删除分类</a>

                                </li>

                            </ul>
                        </li>
                        <li class="sceondC">
                            <a href="#">分类3<span class="submenu-icon "></span></a>
                            <ul>
                                <li>
                                    <a href="#">查看笔记</a>
                                </li>
                                <li>
                                    <a href="#">删除分类</a>

                                </li>

                            </ul>
                        </li>
                        <li class="sceondC">
                            <a href="#">新建分类</a>
                        </li>

                    </ul>
                </li>
                <li class="fristC">
                    <a id="comment"><i class="icon-comments " style="margin: 0px 14px 0 -20px;font-size:30px"></i>工作群聊</a>

                </li>
                <li class="fristC">
                    <a id="trashB"><i class="icon-trash" style="margin: 0px 14px 0 -20px;font-size:30px"></i>废纸篓<span style="line-height: 48px;"></span></a>

                </li>
                <li class="fristC">
                    <a id="logoff" href="${pageContext.request.contextPath}/UserServlet?method=logOut"><i class="icon-off " style="margin: 0px 14px 0 -20px;font-size:30px"></i>注销账户</a>
                </li>
            </ul>
        </div>
        <div class="clear"></div>
    </div>
    <div id="box">
        <!--
                      作者：offline
                      时间：2018-07-24
                      描述：搜索笔记
                  -->
        <br />
        <h1 class="icon-search">搜索笔记</h1>

        <div class="findChat">
            <input id="workInput" class="chatInput1" type="text" name="search" placeholder="请输入关键字">
            <input class="chatInput2" type="button" value="搜索" />
        </div>
        <div>
            <!--
                 作者：offline
                 时间：2018-07-24
                 描述：根据关键字显示符合的笔记
             -->
            <ul>
                <li></li>
                <li></li>
                <li></li>
                <li></li>
                <li></li>
            </ul>

        </div>

    </div>

    <div id="WorkChat">
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

    <div id="trash">
        <!--回收站-->
        <br />
        <h1 class="icon-trash">废纸篓</h1>
        <ul id="note-in-bin">
        </ul>
        <div id="cleanTrash" class="newChat"><i class="icon-trash"></i><span>&nbsp;清空废纸篓</span></div>

    </div>

</div>
<div id="workPlace">
    <div id="BIJI"><p id="note">笔记</p></div>
    <ul id="notelist">

    </ul>
</div>
<div id="mainPlace">
    <div id="editor">
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
    var editor = new E('#editor');
    editor.create();

    document.getElementById('btn1').addEventListener('click', function () {
        // 读取 html
        $.post("${pageContext.request.contextPath}/EditorServlet?method=createNote", {getHTML:editor.txt.html()}, function(data) {
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
            jsInit();
        }, 'json');
    }, false)


    document.getElementById('btn2').addEventListener('click', function () {
        // 保存
        $.post("${pageContext.request.contextPath}/EditorServlet?method=saveNote", {getHTML:editor.txt.html(),noteID:NOTE}, function(data) {
            alert(data);
            changeNote();
        });
    }, false)

    document.getElementById('btn3').addEventListener('click', function () {
        // 删除
        $.post("${pageContext.request.contextPath}/EditorServlet?method=delNote", {noteID:NOTE}, function(data) {
            alert(data);
            editor.txt.clear();
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
                        editor.txt.html(obj.content)
                    });
                }, 'json')
            }, false)
        }
    }


    function jsInit() {
        $(".vertical-nav").verticalnav({
            speed: 400,
            align: "left"
        });
    }

    function init() {
        jsInit();
        $.post("${pageContext.request.contextPath}/NotebookServlet?method=listNotebook", {}, function(data) {
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
            jsInit();
            changeNote();
        }, 'json');

        listNote();

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



    function deleteNotebook() {
        var notebookId = $("#1")


    }
</script>
</body>

</html>