
$(document).ready(function() {
    $(".vertical-nav").verticalnav({
        speed: 400,
        align: "left"
    });

    $("#createNotebook").click(function() {
        $("#createNotebookPop").css("display", "block")
    });
    $(".createNotebookPopSpan").click(function() {
        $("#createNotebookPop").css("display", "none")
    });
    $("#createNote").click(function() {
        $("#createNotePop").css("display", "block")
    });
    $(".createNotePopSpan").click(function() {
        $("#createNotePop").css("display", "none")
    });


});