


#	uniNote
***Let uniNote change the way you organize your personal and professional projects.***

[![MIT License](https://img.shields.io/npm/l/mithril.svg)](https://github.com/seriouszyx/uniNote/blob/master/LICENSE) [![codebeat badge](https://codebeat.co/badges/7c90cb73-2959-4725-9b5d-84faca54601c)](https://codebeat.co/projects/github-com-seriouszyx-uninote-master)

<p align="center">
<a href="https://github.com/seriouszyx/uniNote/blob/master/README.md"><strong>English</strong></a> | <a href="https://github.com/seriouszyx/uniNote/blob/master/README_zh_CN.md"><strong>简体中文</strong></a>
</p>

<!-- TOC -->


- [Introduction](#introduction)
- [Motivation](#motivation)
- [Features](#features)
    - [Good editors](#good-editors)
    - [Beautiful   Login and register page](#beautiful---login-and-register-page)
    - [Useful Functions](#useful-functions)
    - [Share Your Ideas](#share-your-ideas)
- [Installation](#installation)
    - [Requirements](#requirements)
    - [Steps](#steps)
    - [Notes](#notes)
- [Team](#team)
    - [Members](#members)
    - [Contributors Insights](#contributors-insights)
    - [Timeline](#timeline)
- [Community](#community)
- [Sumarization](#sumarization)
    - [About teamwork](#about-teamwork)
    - [About technology](#about-technology)
- [Credits](#credits)

<!-- /TOC -->


##	Introduction

[uniNote](https://github.com/seriouszyx/uniNote) is a web-based notebook to help you to manager daily memos easily. Because you can:

*  Write, collect and capture ideas as searchable notes, notebooks, memos, mark and to-do lists. It’s the only planner you need. 
*	Use uniNote as a digital notepad and easy-to-format word processor for all your thoughts and memos as they come.
*	Learn a lot from the codes as a result of its  `100%`  open source.

##	Motivation

uniNote was born with the following reasons:

*	This project is a comprehensive training of software engineering, the theme is to set up a web-based note. The project takes A month to complete the basic functions.
*	 This project is used to develop teamwork skills. We used the version control system -- `git` to integrate the code during project implementation.


##	Features

###	Good editors

![](https://i.loli.net/2018/08/06/5b68386b3d5e7.gif)

*  format adjustment: bold, italics, hyperlinks, references, etc. the list toolbar button
* picture upload: support for uploading ordinary pictures
* Emoji: most of the mainstream support for Emoji expression
* code insert: support for inserting code and its identification

###	Beautiful   Login and register page

![](https://i.loli.net/2018/08/06/5b68389fe30fb.gif)

*	Inspired by a demo in [codePen](https://codepen.io/pens/)
*	Perfect color and animation

###	Useful Functions

![](https://i.loli.net/2018/08/06/5b68389fa8417.gif)

uniNote is set up like a notebook to bring the familiar physical  binder to the digital era. Easily use sections and pages to separate out thoughts by theme at school, home or work.

Not sure where you categorized something? Use our powerful search to look across all of your notes.

You can use tags to label to-do lists, follow up items, mark what's important or make custom labels. Use uniNote as a notebook, journal or a notepad. Organize in one place, from anyplace. 

###	Share Your Ideas
![](https://i.loli.net/2018/08/06/5b683e6322981.gif)


uniNote gives you the tools to share and collaborate productively with others:  
*  Create, share and discuss with the people who help get your work done, all in one app  
*  Get inspired and brainstorm creative ideas by working collaboratively


##	Installation

**If you want to learn from the code, read this section carefully.**

### Requirements

-   JDK8+
-   MySQL5.5+
-   Jetty9 or Tomcat9
-	Google chrome is better

### Steps

1.  Clone source code
2.  to modify the database after extracting  `src/resources/c3p0-config.xml`  configuration, and create a database named `uniNote`
3.  _may_  need to modify the  container port
4. use `uniNote.sql` to generate table automatically
5.  to deploy the war package to the container, the packages required list below:

![](https://i.loli.net/2018/08/07/5b6930f72a9b7.png)

###	Notes

-   Tomcat with more than 9 version, it is best to use the latest version
- If you encounter problems, you can refer to **community** to contact me

##	Team

###	Members




| <a href="https://github.com/seriouszyx" target="_blank">**seriouszyx**</a> | <a href="https://github.com/StathamWYJ" target="_blank">**StathamWYJ**</a> | <a href="https://github.com/GetlostWGY" target="_blank">**GetlostWGY**</a> |
| :---: |:---:| :---:|
| [![FVCproductions](https://i.loli.net/2018/08/06/5b684a48dd5ea.jpg?s=330)](https://github.com/seriouszyx)    | [![FVCproductions](https://i.loli.net/2018/08/06/5b684b013ad97.png?s-330)](https://github.com/StathamWYJ) | [![FVCproductions](https://i.loli.net/2018/08/06/5b684b0165664.jpg?s=330)](https://github.com/GetlostWGY)  |

<div align = "center"><b>Responsibilities of the team</b></div>
<table>
 <tr>
<td valign="top" width = 330><ul><li>Design and implementation of the whole login and register page</li><li>Data interaction between front-end and back-end</li><li>Database encapsulation</li><li>Integrate members' codes to `index.jsp`</li><li>Back-end architecture</li><li>Call the API to implement the editor</li><li>A part of main page's animation</li><li>Using the MD5 algorithm for password encryption</li><li>E-mail verification function</li></ul></td>
    <td valign="top" width = 330><ul><li>Design main page layout</li><li>Design and implement of left navigation bar</li><li>  
Optimizate animation</li><li>Call the API to implement Share function</li><li>Use Font Awesome to landscape icons</li></ul></td>
    <td valign="top" width = 330><ul><li>Design and implement of editor area</li><li>Form data validation</li><li>Fix the bug</li><li>Implemention of pop-up windows</li></ul></td>
  </tr>
<table>


###	Contributors Insights

![](https://i.loli.net/2018/08/07/5b68f27a050c4.png)

###	Timeline

![](https://i.loli.net/2018/08/07/5b69672983088.png)


## Community

Everyone can discuss the project through the following ways to help the project development:

-   [Report issue](https://github.com/seriouszyx/uniNote/issues)
-   Join uniNote development support QQ 674965440

We are very much looking forward to your advicing the project. Whether it is using feedback or code patches, it is a full of love for uniNote ❤️

&emsp;

##	Sumarization

###	About teamwork

  
In this project, I served as the team leader and was responsible for the progress and standardization of the entire project. Summarize the following problems in the management process:

*	 **The progress of the project was not well controlled**, and the initial schedule of the project was almost completely postponed, resulting in lower quality.

*	 It's important to **have a good code style**, especially in teamwork. When I integrated the front-end code, I found that a lot of code is not standardized, such as css style, id and class name. And it is really difficult to organize.

*	Github is used to host projects and version control during the project. However, the team members are not familiar with the use of github, which makes the local code rushed during the initial push and pull of the project. So I have to **set the master branch protected**.

*  As the team leader, seeing the progress of the project is slower, I am so anxious that the requirements for the team members are stricter, and the attitude is not particularly good. This was promptly realized, and it was improved in time. In the future,  it is most important to maintain a peace of mind and fully **believe in your companions** in teamwork.

###	About technology

In this project, I used the **jsp+servlet**  to build the back-end without using the framework. At the same time, I found that I have not **mastered the knowledge I have learned**, and wrote some complicated code, especially the `index.jsp` page code exceeded 1000 lines. 

This is related to the characteristics of jsp, but more importantly because I did not **have a clear idea** when writing code at the beginning.

So I decided to improve the following aspects in terms of technology:

*	 Consolidate the basics of **jsp and servlet** and  I will record the process of learning [here](https://github.com/seriouszyx/Mooc-and-more).

*	Learn the **SSM framework** and use it to create a more complete web application.

*	Continue to learn the algorithm and data structure with the [CB61B](https://sp18.datastructur.es/) course(Week 7 at present), hope to finish before next semester, my lab, hw, proj are [here](https://github.com/seriouszyx/cs61b).

  
Through this project, the biggest impact to me is that I am more clear about my own direction, understand how to learn, can discern a wide range of technologies in the web field, and can choose the right courses and books.

 
Most importantly, this project has made me more passionate about programming,  github, and  the open source community.

## Credits

uniNote's birth can not be separated from the following open source projects:
-   [jQuery](https://github.com/jquery/jquery): Front end JavaScript tool library
-  [wangEditor](https://github.com/wangfupeng1988/wangEditor/): popular  rich text editor
-  [Font Awesome](https://fontawesome.com/): The iconic SVG, font, and CSS toolkit
-   [IntelliJ IDEA](https://www.jetbrains.com/idea): wonderful IDE
-   [Visual Studio Code](https://github.com/Microsoft/vscode): wonderful code editor

-----------

<div align = "center"><b>Next open source project, build for the future</b></div>
