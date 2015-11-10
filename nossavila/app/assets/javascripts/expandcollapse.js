$(document).ready(function(){
    $(".btnnav").click(function(){
        var id = $(this).attr('id');
        $(this).children().eq(2).slideToggle(500, function () {
            //$(this).text(function () {
                //return $content.is(":visible") ? "Collapse" : "Expand";
             //});
        });
    });
});