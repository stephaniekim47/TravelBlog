$(document).on('ready page:load', function () {

function fixDiv() {
    var $div = $("#wrapper");
    if ($(window).scrollTop() > $div.data("top")+8) { 
        $('#wrapper').addClass("fixed"); 
        $('#cont').addClass("pad"); 
 

    }
    else {
    	$('#wrapper').removeClass("fixed"); 
    	$('#cont').removeClass("pad"); 


    }	
}

$("#wrapper").data("top", $("#wrapper").offset().top); 

$(window).scroll(fixDiv);

});

