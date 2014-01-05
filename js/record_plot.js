(function($) {
    $(document).ready(function() {
	
	$('#record_plot').scianimator({
	    'images': ['images/record_plot1.png', 'images/record_plot2.png', 'images/record_plot3.png', 'images/record_plot4.png', 'images/record_plot5.png', 'images/record_plot6.png', 'images/record_plot7.png', 'images/record_plot8.png', 'images/record_plot9.png', 'images/record_plot10.png', 'images/record_plot11.png', 'images/record_plot12.png', 'images/record_plot13.png', 'images/record_plot14.png', 'images/record_plot15.png', 'images/record_plot16.png', 'images/record_plot17.png', 'images/record_plot18.png', 'images/record_plot19.png'],
	    'width': 480,
	    'delay': 1000,
	    'loopMode': 'loop'
	});
	$('#record_plot').scianimator('play');
    });
})(jQuery);
