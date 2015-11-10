$(document).on('ready page:load', function() {
    $(".expandible").click(function(){
        var id = $(this).attr('id')
        if($(this).hasClass("expand")){
            $(this).removeClass("expand");
            $(this).addClass("collapse");
        }
        else{
            $(this).addClass("expand");
            $(this).removeClass("collapse");
        }
        $("#"+id+".btnnavchilds").slideToggle(500, function () {
            //$(this).text(function () {
                //return $content.is(":visible") ? "Collapse" : "Expand";
             //});
        });
    });
});