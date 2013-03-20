$(document).ready(function () {
	$('.dropdown').hide();
    	$('div.advanced').click(function () {
		$('#login').height(400);
		$('div.dropdown').slideToggle(400);
		$('div.advanced').css('visibility','hidden');
    	});
	//Need to add close button
	$('.close').click(function () {
		$('.dropdown').slideToggle(400);
		$('div.advanced').css('visibility','visible');
    });
	
});
