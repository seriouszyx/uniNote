//这里写js和jq

$(document).ready(function() {

	$("#find").click(function() { //点击搜索弹出搜索界面
		if(document.getElementById("WorkChat").style.left == "200px") {
			$("#WorkChat").stop().animate({

				left: '-272px'
			});
		}
		if(document.getElementById("trash").style.left == "200px") {
			$("#trash").stop().animate({

				left: '-272px'
			});
		}

		if(document.getElementById("box").style.left != "200px") {

			$("#box").stop().animate({

				left: '200px'
			});
		} else {
			$("#box").stop().animate({

				left: '-272px'
			});

		}

	});
	/*
	$(document).click(function() { //点击任意位置搜索框隐藏
		
		$("#box").stop().animate({
			left: '-310px'
		});
	});//防止冒泡
	
	$("#box").click(function(event) {
		event.stopPropagation();
	});
	$("#find").click(function(event) {
		event.stopPropagation();
	});//防止冒泡
	*/
	$("#logoff").click(function() { //点击注销账户进行询问

		var isLogoff = confirm("是否退出当前用户？");
		if(isLogoff) {
			//此处链接到登录页面

		}
	});

	$("#comment").click(function() { //点击工作群聊滑出群聊界面

		if(document.getElementById("box").style.left == "200px") {
			$("#box").stop().animate({

				left: '-272px'
			});
		}
		if(document.getElementById("trash").style.left == "200px") {
			$("#trash").stop().animate({

				left: '-272px'
			});
		}
		if(document.getElementById("WorkChat").style.left != "200px") {

			$("#WorkChat").stop().animate({

				left: '200px'
			});
		} else {
			$("#WorkChat").stop().animate({

				left: '-272px'
			});
		}
	});
	$("#trashB").click(function() { //点击滑出废纸篓

		if(document.getElementById("box").style.left == "200px") {
			$("#box").stop().animate({

				left: '-272px'
			});
		}
		if(document.getElementById("WorkChat").style.left == "200px") {
			$("#WorkChat").stop().animate({

				left: '-272px'
			});
		}
		if(document.getElementById("trash").style.left != "200px") {

			$("#trash").stop().animate({

				left: '200px'
			});
		} else {
			$("#trash").stop().animate({

				left: '-272px'
			});
		}
	});
	$(".trashi").click(function() { //确认是否彻底删除
		var x=confirm("是否彻底删除该笔记？");
		if(x)
		{
			
		}
		else
		{
			
		}
		
	});
	
	$("#cleanTrash").click(function() { //确认是否清空废纸篓
		var x=confirm("是否清空废纸篓？");
		if(x)
		{
			
		}
		else
		{
			
		}
		
	});
	

});