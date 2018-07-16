$(function() {
	$('#edit').editable({
		inlineMode: false,
		alwaysBlank: true
	})
});


    var E = window.wangEditor
    var editor = new E('#div1')
    editor.create()

    document.getElementById('btn1').addEventListener('click', function () {
        // 读取 html
        alert(editor.txt.html())
    }, false)

    document.getElementById('btn2').addEventListener('click', function () {
        // 读取 text
        alert(editor.txt.text())
    }, false)
    document.getElementById('btn3').addEventListener('click', function () {
        // 读取 html
        var rewrite=confirm("是否确定重新编辑笔记？");
        if(rewrite)
        {
        	editor.txt.clear()
        	
        }
        
    }, false)
    document.getElementById('btn4').addEventListener('click', function () {
        var json = editor.txt.getJSON()  // 获取 JSON 格式的内容
        var jsonStr = JSON.stringify(json)
        console.log(json)
        console.log(jsonStr)
    })


function noteBooks() {

	var x = document.getElementById("noteBooks");
	var y = document.getElementById("createNote");
	
	y.style.display = "none";
	
	if(x.style.display == "block") {
		x.style.display = "none";
	} else {
		x.style.display = "block";
	}
	
}
function create()
{
	var x=document.getElementById("noteBooks");
	var y=document.getElementById("createNote");
	
	x.style.display = "none";
	
	if(y.style.display == "block") {
		y.style.display = "none";
	} else {
		y.style.display = "block";
	}
	
	
}
