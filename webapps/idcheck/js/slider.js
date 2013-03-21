$(document).ready(function () {
	$('.dropdown').hide();
    	$('div.advanced').click(function () {
		a = $('.dropdown').height();
		n =  $('#login').height() + a + 20;
		$('#login').height(n);
		$('div.dropdown').slideToggle(400);
		$('div.advanced').css('visibility','hidden');
    	});
	//Need to add close button
	$('.close').click(function () {
		$('.dropdown').slideToggle(400);
		$('div.advanced').css('visibility','visible');
    });
	
});
