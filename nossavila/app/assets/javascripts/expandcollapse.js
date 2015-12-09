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
        $("#"+ id.substring(0, id.length - 8) +".btnnavchilds").slideToggle(500, function () {
            //$(this).text(function () {
                //return $content.is(":visible") ? "Collapse" : "Expand";
             //});
        });
    });
   $(".add-info-header").click(function(){ 
       $(".add-info-box").slideToggle(500);
   });

});
