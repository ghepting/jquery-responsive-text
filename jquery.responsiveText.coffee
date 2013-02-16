###
 *
 *  jQuery ResponsiveText by Gary Hepting - https://github.com/ghepting/responsiveText
 *  
 *  Open source under the BSD License. 
 *
 *  Copyright © 2013 Gary Hepting. All rights reserved.
 *
###

(($) ->
  elems = []
  $.fn.responsiveText = (options) ->
    settings =
      compressor: options.compressor or 10
      minSize: options.minSize or Number.NEGATIVE_INFINITY
      maxSize: options.maxSize or Number.POSITIVE_INFINITY

    @each ->
    	elem = $(this)
    	elem.attr('data-compression',settings.compressor)
    	elem.attr('data-min',settings.minSize)
    	elem.attr('data-max',settings.maxSize)
    	elem.css "font-size", Math.floor(Math.max(Math.min(elem.width() / (settings.compressor), parseFloat(settings.maxSize)), parseFloat(settings.minSize)))
    	elems.push elem

  $(window).on "resize", ->
   	$(elems).each ->
   		elem = $(this)
   		elem.css "font-size", Math.floor(Math.max(Math.min(elem.width() / (elem.attr('data-compression')), parseFloat(elem.attr('data-max'))), parseFloat(elem.attr('data-min'))))

) jQuery