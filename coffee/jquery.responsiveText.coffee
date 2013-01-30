###
 *  jQuery responsiveText - http://github.com/ghepting/responsiveText
 *  Now a lovely little piece of GroundworkCSS - http://groundworkcss.github.com/
###

(($) ->
  elems = []
  $.fn.responsiveText = (options) ->
    settings =
      agressiveness: options.agressiveness or 10
      minSize: options.minSize or Number.NEGATIVE_INFINITY
      maxSize: options.maxSize or Number.POSITIVE_INFINITY

    @each ->
    	elem = $(this)
    	elem.attr('data-scale',settings.agressiveness)
    	elem.attr('data-min',settings.minSize)
    	elem.attr('data-max',settings.maxSize)
    	elem.css "font-size", Math.floor(Math.max(Math.min(elem.width() / (settings.agressiveness), parseFloat(settings.maxSize)), parseFloat(settings.minSize)))
    	elems.push elem

  $(window).on "resize", ->
   	$(elems).each ->
   		elem = $(this)
   		elem.css "font-size", Math.floor(Math.max(Math.min(elem.width() / (elem.attr('data-scale')), parseFloat(elem.attr('data-max'))), parseFloat(elem.attr('data-min'))))

) jQuery