$(function() {
	$('.to_messages > .alert').hide();
	$('.to_messages > .alert').fadeIn(1500, function() {
		$(this).delay(3000).fadeOut(1000, function() {
			// $('.alert').fadeIn();
		});
	});
}); 