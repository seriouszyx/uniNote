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
                    <a href="UserInformation.html" target="_blank"><i class="icon-user " style="margin: -14.958px 14px 15px -20px;"></i>个人中心</a>
                </li>
                <li class="fristC">
                    <a id="newB" name="0" class="chooseB"><i class="icon-edit " style="margin: 0px 14px 0 -20px;font-size:30px"></i>新建笔记</a>
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

        <h1 class="icon-search">搜索</h1>

        <div id="findinput">
            <form action="#">
                <input id="searchNote" type="text" name="search" placeholder="搜索笔记" />
            </form>
        </div>
        <div id="findul">
            <ul>
                <!--搜索到的匹配项-->
                <li></li>
                <li></li>
                <li></li>
                <li></li>
            </ul>
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
            <div class="starli">
                <div class="starName"><i class="icon-book"></i>高数笔记本</div>
                <div class="starBtn"><i class="icon-minus-sign notebli_i" title="删除快捷方式"></i></div>
            </div>
            <div class="starli">
                <div class="starName"><i class="icon-tag"></i>JAVA</div>
                <div class="starBtn"><i class="icon-minus-sign notebli_i" title="删除快捷方式"></i></div>
            </div>
            <div class="starli">
                <div class="starName"><i class="icon-file"></i>7/27笔记</div>
                <div class="starBtn"><i class="icon-minus-sign notebli_i" title="删除快捷方式"></i></div>
            </div>
            <div class="starli">
                <div class="starName"><i class="icon-book"></i>日记本</div>
                <div class="starBtn"><i class="icon-minus-sign notebli_i" title="删除快捷方式"></i></div>
            </div>
            <div class="starli">
                <div class="starName"><i class="icon-tag"></i>C++</div>
                <div class="starBtn"><i class="icon-minus-sign notebli_i" title="删除快捷方式"></i></div>
            </div>
            <div class="starli">
                <div class="starName"><i class="icon-book"></i>高数笔记本</div>
                <div class="starBtn"><i class="icon-minus-sign notebli_i" title="删除快捷方式"></i></div>
            </div>
            <div class="starli">
                <div class="starName"><i class="icon-tag"></i>JAVA</div>
                <div class="starBtn"><i class="icon-minus-sign notebli_i" title="删除快捷方式"></i></div>
            </div>
            <div class="starli">
                <div class="starName"><i class="icon-file"></i>7/27笔记</div>
                <div class="starBtn"><i class="icon-minus-sign notebli_i" title="删除快捷方式"></i></div>
            </div>
            <div class="starli">
                <div class="starName"><i class="icon-book"></i>日记本</div>
                <div class="starBtn"><i class="icon-minus-sign notebli_i" title="删除快捷方式"></i></div>
            </div>
            <div class="starli">
                <div class="starName"><i class="icon-tag"></i>C++</div>
                <div class="starBtn"><i class="icon-minus-sign notebli_i" title="删除快捷方式"></i></div>
            </div>
            <div class="starli">
                <div class="starName"><i class="icon-book"></i>高数笔记本</div>
                <div class="starBtn"><i class="icon-minus-sign notebli_i" title="删除快捷方式"></i></div>
            </div>
            <div class="starli">
                <div class="starName"><i class="icon-tag"></i>JAVA</div>
                <div class="starBtn"><i class="icon-minus-sign notebli_i" title="删除快捷方式"></i></div>
            </div>
            <div class="starli">
                <div class="starName"><i class="icon-file"></i>7/27笔记</div>
                <div class="starBtn"><i class="icon-minus-sign notebli_i" title="删除快捷方式"></i></div>
            </div>
            <div class="starli">
                <div class="starName"><i class="icon-book"></i>日记本</div>
                <div class="starBtn"><i class="icon-minus-sign notebli_i" title="删除快捷方式"></i></div>
            </div>
            <div class="starli">
                <div class="starName"><i class="icon-tag"></i>C++</div>
                <div class="starBtn"><i class="icon-minus-sign notebli_i" title="删除快捷方式"></i></div>
            </div>
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
<div id="overlay"></div>

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
        // searchNote();

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

    function listNotebook() {
        $.post("${pageContext.request.contextPath}/NotebookServlet?method=listNotebook", {}, function(data) {
            $("#notebul").html("");
            $.each(data, function(i, obj) {
                if (obj.isStart == 1) {
                    var div = "<div class=\"notebli\" id=\"notebook"+obj.id+"\">\n" +
                        "<div class=\"notebliBook\"><i class=\"icon-book\"></i>"+obj.bookName+"</div>\n" +
                        "<div class=\"notebliBtn\"><i title=\"修改名称\" class=\"icon-magic notebli_i\"></i><i title=\"添加/（删除）快捷方式\" class=\"icon-star-empty notebli_i markNotebook icon-star \"></i><i title=\"删除笔记本\" class=\"icon-trash notebli_i delNotebook\"></i></div>\n" +
                        "</div>";
                } else {
                    var div = "<div class=\"notebli\" id=\"notebook"+obj.id+"\">\n" +
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

    $("#markB").on('click', function() {
        listMark();
    })

    function listMark() {
            $.post("${pageContext.request.contextPath}/MarkServlet?method=listMark", {}, function(data) {
                $("#markul").html("");
                $.each(data, function(i, obj) {
                    var div = "<div class=\"notebli\" id=\"mark"+obj.id+"\">\n" +
                        "<div class=\"markli\"><i class=\"icon-tag\"></i>"+obj.markName+"</div>\n" +
                        "<div class=\"notebliBtn\">\n" +
                        "<a name=\"0\" title=\"修改标签名\" class=\"icon-pencil notebli_i\"></a><i title=\"添加/（删除）快捷方式\" class=\"icon-star-empty notebli_i\"></i><i title=\"删除标签\" class=\"icon-trash notebli_i\"></i></div>\n" +
                        "</div>";
                    $("#markul").append(div);
                })
                btnAnimation();
            }, 'json')
    }

    <!--
    function searchNote() {
        var form = new FormData();
        var keyword = $("#searchNote").val();
        form.append("keyword",keyword);
        $.ajax({
            url:"${pageContext.request.contextPath}/public/testupload",
            type:"post",
            data:form,
            processData:false,
            contentType:false,
            success:function(data){
                window.clearInterval(timer);
                console.log("over..");
            }
        });
    }
-->


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