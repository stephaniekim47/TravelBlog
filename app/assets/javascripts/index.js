$(document).on('ready page:load', function () {

function fixDiv() {
    var $div = $("#wrapper");
    if ($(window).scrollTop() > $div.data("top")) { 
        $('#wrapper').css({'z-index': '600', 'position': 'fixed', 'top': '0', 'width': '100%', 'height': '57px'}); 
    }
    else {
        //$('#wrapper').css({'position': 'static', 'top': 'auto', 'width': '100%', 'height': '57px'});
    	$('#wrapper').css({'position': 'static', 'width': '100%', 'height': '57px', })	
    }	
}

$("#wrapper").data("top", $("#wrapper").offset().top); // set original position on load
$(window).scroll(fixDiv);
});