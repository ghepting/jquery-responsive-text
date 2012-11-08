/*
 * jQuery responsiveText - http://github.com/ghepting/responsiveText
 * 
 * Open source under the BSD License. 
 * 
 * Copyright © 2012 Gary Hepting
 * All rights reserved.
 */

(function($) {
	$.fn.responsiveText = function(options) {
    	var settings = {
			'agressiveness': options.agressiveness || 10,
			'minSize': options.minSize || Number.NEGATIVE_INFINITY,
			'maxSize': options.maxSize || Number.POSITIVE_INFINITY
		}
		return this.each(function(){
			var elem = $(this);
			var resizeText = function() {
				elem.css('font-size', Math.floor(Math.max(Math.min(elem.width() / (settings.agressiveness), parseFloat(settings.maxSize)), parseFloat(settings.minSize))));
			};
			resizeText();
			$(window).on('resize', resizeText);
		});
	}
}(jQuery));