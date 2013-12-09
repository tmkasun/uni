
var delay = (function() {
	var timer = 0;
	return function(callback, ms) {
		clearTimeout(timer);
		timer = setTimeout(callback, ms);
	};
})();


$(function() {
	$("#search_box").on("keyup",function() {

		delay(function() {
			// alert($("#search_box").serialize());
			$.post("/features/search", $("#search_box").serialize(),null,"script");
		}, 500);

	});
	

	$('.to_messages > .alert').hide();
	$('.to_messages > .alert').fadeIn(1500, function() {
		$(this).delay(3000).fadeOut(1000, function() {
			// $('.alert').fadeIn();
		});
	});

});


