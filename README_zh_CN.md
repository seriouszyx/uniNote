


#	uniNote
***使用 uniNote 管理工作和生活，让一切井井有条***

[![MIT License](https://img.shields.io/npm/l/mithril.svg)](https://github.com/seriouszyx/uniNote/blob/master/LICENSE) [![codebeat badge](https://codebeat.co/badges/7c90cb73-2959-4725-9b5d-84faca54601c)](https://codebeat.co/projects/github-com-seriouszyx-uninote-master)

<p align="center">
<a href="https://github.com/seriouszyx/uniNote/blob/master/README.md"><strong>English</strong></a> | <a href="https://github.com/seriouszyx/uniNote/blob/master/README_zh_CN.md"><strong>简体中文</strong></a>
</p>

<!-- TOC -->


- [简介](#简介)
- [动机](#动机)
- [功能特性](#功能特性)
    - [好用的编辑器](#好用的编辑器)
    - [美观的登陆/注册页面](#美观的登陆注册页面)
    - [实用的功能](#实用的功能)
    - [交流分享](#交流分享)
- [安装](#安装)
    - [环境准备](#环境准备)
    - [部署](#部署)
    - [细节说明](#细节说明)
- [团队](#团队)
    - [成员](#成员)
    - [成员贡献率](#成员贡献率)
    - [项目时间线](#项目时间线)
- [社区](#社区)
- [总结](#总结)
    - [关于团队合作](#关于团队合作)
    - [关于技术](#关于技术)
- [鸣谢](#鸣谢)

<!-- /TOC -->

##	简介

[uniNote](https://github.com/seriouszyx/uniNote)   是一款基于 web 端的云笔记，可帮助你轻松管理每天的信息，它具备以下功能:

*  将你的灵感收集编写成可搜索的笔记，提供的笔记本、备忘录、标记和待办事项列表等功能会为你规划一天的生活。
*	uniNote 不仅是一个数字化的笔记本，更是一个易于排版的编辑器，可以满足你所有的需求。
*	你可以从源码中学到很多东西，因为 uniNote 是 `100%` 开源的。

##	动机

uniNote 的诞生是有如下几点原因：

*	这个项目是软件开发的综合实训，主题是做一个云笔记应用。项目时间为一个月，完成一个云笔记的基本功能
*	同时，这个项用来锻炼团队协同开发能力。在项目开发过程中，我们使用版本控制工具——git 来整合代码。


##	功能特性

###	好用的编辑器

![](https://i.loli.net/2018/08/06/5b68386b3d5e7.gif)

*   格式调整：粗体、斜体、超链接、引用、列表等可以通过工具栏按钮使用
*  图片上传：支持本地导入和网络导入两种图片上传方式
* Emoji: 支持大部分主流 Emoji 表情，可扩充
* 插入代码：支持代码插入并予以标识

###	美观的登陆/注册页面

![](https://i.loli.net/2018/08/06/5b68389fe30fb.gif)

*	灵感来源于 [codePen](https://codepen.io/pens/) 上的一个 demo
*	完美的色彩搭配和动态效果

###	实用的功能

![](https://i.loli.net/2018/08/06/5b68389fa8417.gif)


  
uniNote 就像笔记本一样，它将熟悉的物理活页夹带入数字世界。面向主题分类的思想可以让你很好地区分学校、工作或家庭中不同的笔记内容。

不确定你将笔记分到了哪一类？使用模糊搜索功能，可以快速定位你的笔记。

你可以使用标签来将要处理的事情、跟进项目、标记重要内容或制作自定义标签。uniNote 会伴随你的生活。

###	交流分享
![](https://i.loli.net/2018/08/06/5b683e6322981.gif)

uniNote 提供了和其他人交流灵感的方法

*	你可以将记录的笔记分享至多个社交网站上
*	朋友的评论和观点将激发你新的头脑风暴


##	安装

**如果你想从源码中学习一些知识，一定要仔细阅读这部分。**

###  环境准备

-   安装 JDK，版本**至少需要 JDK8**
-   安装 MySQL，版本**至少需要 5.5**
-   安装 Tomcat 或 Jetty，版本**至少需要 9**
-	谷歌浏览器能更好地展示页面效果

### 部署

1.  克隆源代码
2.  根据你的数据库更改  `src/resources/c3p0-config.xml`  路径下的配置文件，然后创建一个叫 `uniNote` 的数据库
3.  可能需要更改 tomcat 的端口
4. 使用 `uniNote.sql` 文件自动生成表
5.  将下面的 jar 包导入工程：

![](https://i.loli.net/2018/08/07/5b6930f72a9b7.png)

###	 细节说明

-   Tomcat 的版本最好是最新版本
- 如果在安装过程中有问题的话,你可以通过 [**社区**](#社区) 中给出的方式联系我

##	团队

###	成员



| <a href="https://github.com/seriouszyx" target="_blank">**seriouszyx**</a> | <a href="https://github.com/StathamWYJ" target="_blank">**StathamWYJ**</a> | <a href="https://github.com/GetlostWGY" target="_blank">**GetlostWGY**</a> |
| :---: |:---:| :---:|
| [![FVCproductions](https://i.loli.net/2018/08/06/5b684a48dd5ea.jpg?s=330)](https://github.com/seriouszyx)    | [![FVCproductions](https://i.loli.net/2018/08/06/5b684b013ad97.png?s-330)](https://github.com/StathamWYJ) | [![FVCproductions](https://i.loli.net/2018/08/06/5b684b0165664.jpg?s=330)](https://github.com/GetlostWGY)  |

<div align = "center"><b>成员分工</b></div>
<table>
 <tr>
<td valign="top" width = 330><ul><li>整个登陆/注册页面的设计和实现</li><li>前后端的数据交互</li><li>数据库设计封装</li><li>将组员的代码整合成 index.jsp 文件</li><li>后端的架构设计</li><li>编辑器 API 调用</li><li>一部分前端动画的实现</li><li>使用 MD5 算法进行密码的加密存储</li><li>邮箱验证功能</li></ul></td>
    <td valign="top" width = 330><ul><li>主页面的设计</li><li>左侧导航栏的设计和实现</li><li>  
优化动态效果</li><li>分享功能的 API 调用</li><li>使用 Font Awesome 来美化图标</li></ul></td>
    <td valign="top" width = 330><ul><li>编辑区域的设计和实现</li><li>表单验证</li><li>bug 调试修复</li><li>实现弹窗效果</li></ul></td>
  </tr>
<table>


###	成员贡献率

![](https://i.loli.net/2018/08/07/5b68f27a050c4.png)

###	项目时间线

![](https://i.loli.net/2018/08/07/5b69672987324.png)


## 社区

大家可以通过以下方式进行项目讨论，帮助项目发展：

-   [报告问题](https://github.com/seriouszyx/uniNote/issues)
-   uniNote 开发支持 QQ 674965440

我们非常期待你加入到项目中，无论是使用反馈还是代码补丁，都是对 uniNote 一份满满的爱 ❤️

&emsp;

##	总结

###	关于团队合作

  
  
在此项目中我担任组长，负责整个项目的进度和规范安排。总结一下管理过程中存在以下几点问题：

*	项目的进度没有控制好，初期制定的项目进度计划几乎全部推迟完成，导致后期项目质量较低。

*	有一个良好的代码风格非常非常重要，尤其是在团队合作中。当我整合前后端代码时，我发现很多代码都缺乏规范，就像 css 的样式、id 和 class 的命名，在最后整理代码时逻辑混乱。


* 项目过程中用 github 来托管项目和版本控制。然而组员对 github 的运用不熟悉，导致项目初期在 pull 和 push 的过程中使 master 的代码混乱，所以后来我不得不把 master 设置成保护分支。


* 作为组长，可能看项目进展缓慢比较心急，对组员的要求比较严格，态度不是特别好。这一点及时意识到，并且后来及时改正。在以后的团队合作中，保持一个平和的心态尤其重要，要充分信任你的同伴。

###	关于技术

在这个项目的后台搭建过程中，我没有使用框架，而是使用了 `jsp + servlet` 的较原始的方法。同时，我发现自己对这些基础知识的掌握并不透彻，对 MVC 模式的理解也不够清晰，代码没有考虑重用，以致代码混乱冗杂，特别是 `index.jsp` 文件代码量超过了 1000 行。

一部分原因是 jsp 的特点，不能将页面元素与交互的功能代码分离，不过更重要的是在项目初期，我没有一个清晰的思路，前端完成一部分样式，我就完成相应的功能，与前端交互的代码结构散乱。

所以在接下来的一段时间里，我希望能提高自己以下方面的技术：

*	复习 `jsp 和 servlet` 的基础知识，我将总结知识要点并把它记录在[这里](https://github.com/seriouszyx/Mooc-and-more)。

*	开始学习 SSM 框架，掌握 Maven，了解 Jekins，并使用它们来完成一个完整的项目。

*	继续跟随[CB61B](https://sp18.datastructur.es/) 课程学习数据结构和算法（目前学习到第七周），我希望能在下学期刚开学的阶段完成这门课程，我的 lab, hw, proj 都在[这里](https://github.com/seriouszyx/cs61b)记录。

通过这个项目，给我最大的影响是我更加明确了自己的学习方向，逐渐掌握了学习方法，可以分辨 web 领域各种各样的技术，不被五花八门的网络课程迷惑，从中选择适合自己的课程和书籍。
 
 最重要的是，这个项目让我更加热爱编程，热爱 GitHub，热爱开源。

## 鸣谢

uniNote 的诞生离不开以下开源项目：
-   [jQuery](https://github.com/jquery/jquery): 前端 JavaScript 工具库
-  [wangEditor](https://github.com/wangfupeng1988/wangEditor/): 灵巧易用的编辑器
-  [Font Awesome](https://fontawesome.com/): 基于css框架的网页字体图标库
-   [IntelliJ IDEA](https://www.jetbrains.com/idea): 全宇宙暂时排名第二的 IDE
-   [Visual Studio Code](https://github.com/Microsoft/vscode): 全宇宙暂时排名第二的文本编辑器

-----------

<div align = "center"><b>下一个开源项目，为未来而创建</b></div>
