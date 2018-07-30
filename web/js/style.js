//这里写js和jq
//创建笔记本确认
function notecIsnull() {
	if(document.getElementById("notecdivinput").value == "") {
		alert("名称不能为空！");
	} else {
		alert("创建成功！");
		hideOverlay();
	}
}

$(function() {
	$(document).tooltip();
});

//添加标签确认
function markcIsnull() {
	if(document.getElementById("markcdivinput").value == "") {
		alert("名称不能为空！");
	} else {
		alert("添加成功！");
		hideOverlay();
	}
}
//提示信息
function ntipsShow() {
	document.getElementById("notebTips").style.display = "block";
}
//提示信息
function ntipsHide() {
	document.getElementById("notebTips").style.display = "none";
}
//提示信息
function mtipsShow() {
	document.getElementById("markTips").style.display = "block";
}
//提示信息
function mtipsHide() {
	document.getElementById("markTips").style.display = "none";
}
//提示信息
function ctipsShow() {
	document.getElementById("commentTips").style.display = "block";
}
//提示信息
function ctipsHide() {
	document.getElementById("commentTips").style.display = "none";
}
//打开comment弹窗
function newCommentOpen() {

	$("#commentc").fadeTo(200, 1);
}
//关闭comment弹窗
function newCommentClose() {

	$("#commentc").fadeOut(200);
}

//弹出遮罩
function newShowOverlay() {
	$("#overlay").height(document.body.scrollHeight);
	$("#overlay").width(document.body.scrollWidth);
	// fadeTo第一个参数为速度，第二个为透明度
	// 多重方式控制透明度，保证兼容性，但也带来修改麻烦的问题
	$("#overlay").fadeTo(200, 1);
	// 解决窗口缩小时放大后不全屏遮罩的问题
	// 简单来说，就是窗口重置的问题
	$(window).resize(function() {
		$("#overlay").height(document.body.scrollHeight);
		$("#overlay").width(document.body.scrollWidth);
	});

	$("#notec").fadeTo(200, 1);
}
//隐藏遮罩
function newHideOverlay() {
	$("#overlay").fadeOut(200);
	$("#notec").fadeOut(200);

}
//弹出遮罩
function markShowOverlay() {
	$("#overlay").height(document.body.scrollHeight);
	$("#overlay").width(document.body.scrollWidth);
	// fadeTo第一个参数为速度，第二个为透明度
	// 多重方式控制透明度，保证兼容性，但也带来修改麻烦的问题
	$("#overlay").fadeTo(200, 1);
	// 解决窗口缩小时放大后不全屏遮罩的问题
	// 简单来说，就是窗口重置的问题
	$(window).resize(function() {
		$("#overlay").height(document.body.scrollHeight);
		$("#overlay").width(document.body.scrollWidth);
	});

	$("#markc").fadeTo(200, 1);
}
//隐藏遮罩
function markHideOverlay() {
	$("#overlay").fadeOut(200);
	$("#markc").fadeOut(200);

}
$(document).ready(function() {

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

	//点击注销账户进行询问并链接到登录页面
	$("#logoffB").click(function() {
		var isLogoff = confirm("是否退出当前用户？");
		if(isLogoff) {

		} else {

		}
	});
	//确认是否彻底删除
	$(".trashi").click(function() {
		var x = confirm("是否彻底删除该笔记？");
		if(x) {

		} else {

		}

	});
	//确认是否清空废纸篓
	$("#cleanTrash").click(function() {
		var x = confirm("是否清空废纸篓？");
		if(x) {

		} else {

		}

	});

	//点击新建笔记,收起workPlace，放大mainPlace
	$("#newB").click(function() {

	});

	//choose选中样式
	$(".chooseB").click(function() {
		var btnB = document.getElementsByClassName("chooseB");

		if(this.name == "1") {
			
			if(this.id=="newB")
			{
				$("#mainPlace").stop().animate({

				width: '53.5%'
			});
			}
			$(this).removeClass("onchoose");
			this.name = "0";
			$("#" + this.id.replace("B", "")).stop().animate({

				left: '-285px'
			});
			
			
			$("#workPlace").fadeTo(200, 1);
			

		} else if(this.name == "0") {
			
			if(this.id=="newB")
			{
				$("#mainPlace").stop().animate({

				width: '85.5%'
			});
			}else{
				
				$("#mainPlace").stop().animate({

				width: '53.5%'
			});
				
			}
			
			
			
			$("#workPlace").fadeOut(200);
			$(".chooseB").removeClass("onchoose");

			$(".show").stop().animate({

				left: '-285px'
			});
			for(var i = 0; i < btnB.length; i++) {
				btnB[i].name = "0";

			}

			$(this).addClass("onchoose");
			this.name = "1";

			$("#" + this.id.replace("B", "")).stop().animate({

				left: '210px'
			});

		}

	});
	//笔记本：标记快捷方式/删除快捷方式
	$(".icon-star-empty").click(function() {
		$(this).toggleClass("icon-star");

	});
	//点击编辑标签名称
	$(".icon-pencil").click(function() {

		var btnI = document.getElementsByClassName("icon-pencil");
		var btnM = document.getElementsByClassName("markli");
		if(this.name == "1") {
			$(this).parent().prev().stop().animate({
				width: '100px'
			});
			this.name = "0";
		} else if(this.name == "0") {
			for(var i = 0; i < btnI.length; i++) {
				btnI[i].name = "0";
				btnM[i].style.width = "100px";

			}
			$(this).parent().prev().stop().animate({
				width: '220px'
			});
			this.name = "1";
		}

	});

});

//弹出隐藏层
function ShowDiv(show_div, bg_div) { 
	document.getElementById(show_div).style.display = 'block'; 
	document.getElementById(bg_div).style.display = 'block'; 
	var bgdiv = document.getElementById(bg_div); 
	bgdiv.style.width = document.body.scrollWidth;  // bgdiv.style.height = $(document).height();
	 
	$("#" + bg_div).height($(document).height());
};
//关闭弹出层
function CloseDiv(show_div, bg_div) { 
	document.getElementById(show_div).style.display = 'none'; 
	document.getElementById(bg_div).style.display = 'none';
};
