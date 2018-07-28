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
			$(this).removeClass("onchoose");
			this.name = "0";
			$("#" + this.id.replace("B", "")).stop().animate({

				left: '-285px'
			});

		} else if(this.name == "0") {
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
	$(".icon-pencil").click(function(){
		
		var btnI=document.getElementsByClassName("icon-pencil");
		var btnM=document.getElementsByClassName("markli");
		if(this.name=="1")
		{
			$(this).parent().prev().stop().animate({
				width: '100px'
			});
			this.name="0";
		}else if(this.name=="0"){
			for(var i=0;i<btnI.length;i++)
			{
				btnI[i].name = "0";
				btnM[i].style.width="100px";
				
			}
			$(this).parent().prev().stop().animate({
				width: '220px'
			});
			this.name="1";
		}
		
		

		
			
		
		
		
	});
	
	
	
	
	

});