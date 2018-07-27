//这里写js和jq

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

				left: '-272px'
			});

		} else if(this.name == "0") {
			$(".chooseB").removeClass("onchoose");

			$(".show").stop().animate({

				left: '-272px'
			});
			for(var i = 0; i < btnB.length; i++) {
				btnB[i].name = "0";

			}

			$(this).addClass("onchoose");
			this.name = "1";

			$("#" + this.id.replace("B", "")).stop().animate({

				left: '200px'
			});

		}

	});

});