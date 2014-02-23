var delay = (function() {
	var timer = 0;
	return function(callback, ms) {
		clearTimeout(timer);
		timer = setTimeout(callback, ms);
	};
})();

$(function() {
	$(document).on("keyup", "#search_box", function() {

		var $th = $(this);
		var valid = true;
		$th.val($th.val().replace(/[^a-zA-Z0-9.]/g, function(str) {
			valid = false;
			return "";
		}));
		if (!valid)
			return 0;

		$("#search_loading_animation").fadeIn();
		delay(function() {
			// alert($("#search_box").serialize());
			$.post("/features/search", $("#search_box").serialize(), null, "script");
			$("#search_loading_animation").fadeOut();
		}, 500);

	});

});

