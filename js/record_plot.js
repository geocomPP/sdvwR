(function($) {
    $(document).ready(function() {
	
	$('#record_plot').scianimator({
	    'images': [],
	    'width': 480,
	    'delay': 1000,
	    'loopMode': 'loop'
	});
	$('#record_plot').scianimator('play');
    });
})(jQuery);
