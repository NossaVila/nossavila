$(document).on('ready page:load', function() {
    $(".btnnav").click(function(){
        $(this).children().eq(2).slideToggle(500, function () {
            //$(this).text(function () {
                //return $content.is(":visible") ? "Collapse" : "Expand";
             //});
        });
    });
});