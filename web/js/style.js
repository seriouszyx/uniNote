$(document).ready(function() {

	$("#find").click(function() { //点击搜索弹出搜索框
		if(document.getElementById("WorkChat").style.left == "0px")

		{
			$("#WorkChat").stop().animate({

				left: '-480px'
			});

		}

		if(document.getElementById("box").style.left != "0px") {

			$("#box").stop().animate({

				left: '0px'
			});
		} else {
			$("#box").stop().animate({

				left: '-480px'
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

		if(document.getElementById("box").style.left == "0px") {
			$("#box").stop().animate({

				left: '-480px'
			});


		}

		if(document.getElementById("WorkChat").style.left != "0px") {

			$("#WorkChat").stop().animate({

				left: '0px'
			});
		} else {
			$("#WorkChat").stop().animate({

				left: '-480px'
			});

		}
	});


});