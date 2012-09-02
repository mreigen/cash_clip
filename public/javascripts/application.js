// NAVIGATION SCRIPTS
$(document).ready(function() {
	$(".navbar a").click(function() {
		console.log($(this).parent());
		$(this).parent().find("li").removeClass("active");
		$(this).parent().addClass("active");
	});
});