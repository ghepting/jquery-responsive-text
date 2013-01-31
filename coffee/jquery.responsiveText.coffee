###
 *  jQuery responsiveText - http://github.com/ghepting/responsiveText
 *  Now a lovely little piece of GroundworkCSS - http://groundworkcss.github.com/
###

(($) ->
  elems = []
  $.fn.responsiveText = (options) ->
    defaults =
      agressiveness: 10
      minSize: Number.NEGATIVE_INFINITY
      maxSize: Number.POSITIVE_INFINITY

    options = $.extend(defaults, options)

    @each ->
      elem = $(this)
      agressiveness = elem.attr('data-scale') || options.agressiveness
      minSize = elem.attr('data-min') || options.minSize
      maxSize = elem.attr('data-max') || options.maxSize
      elem.attr('data-scale',agressiveness)
      elem.attr('data-min',minSize)
      elem.attr('data-max',maxSize)
      elem.css "font-size", Math.floor(Math.max(Math.min(elem.width() / (agressiveness), parseFloat(maxSize)), parseFloat(minSize)))
      elems.push elem

  $(window).on "resize", ->
    $(elems).each ->
      elem = $(this)
      elem.css "font-size", Math.floor(Math.max(Math.min(elem.width() / (elem.attr('data-scale')), parseFloat(elem.attr('data-max'))), parseFloat(elem.attr('data-min'))))

) jQuery