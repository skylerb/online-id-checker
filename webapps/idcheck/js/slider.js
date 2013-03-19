$(document).ready(function () {
	$('.dropdown').hide();
    $('div.advanced').click(function () {
		$('.dropdown').slideToggle(400);
		$('div.advanced').css('visibility','hidden');
    });
	$('.close').click(function () {
		$('.dropdown').slideToggle(400);
		$('div.advanced').css('visibility','visible');
    });
	
});
