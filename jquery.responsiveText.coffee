###
 *
 *  jQuery ResponsiveText by Gary Hepting - https://github.com/ghepting/jquery-responsive-text
 *  
 *  Open source under the MIT License. 
 *
 *  Copyright © 2013 Gary Hepting. All rights reserved.
 *
###

delayedAdjust = []
responsiveTextIndex = 0

class ResponsiveText

  constructor: (el) ->
    @index = responsiveTextIndex++
    @el = el
    @compression = $(@el).data('compression') || 10
    @minFontSize = $(@el).data('min') || Number.NEGATIVE_INFINITY
    @maxFontSize = $(@el).data('max') || Number.POSITIVE_INFINITY
    @scrollable  = $(@el).data('scrollable') || false
    @scrollSpeed  = $(@el).data('scrollspeed') || 650
    @scrollReset = $(@el).data('scrollreset') || 200
    @init()

  init: ->
    $(@el).wrapInner('<span class="responsiveText-wrapper" />')
    @adjustOnLoad()
    @adjustOnResize()
    @scrollOnHover() if @scrollable

  resizeText: ->
    $(@el).css "font-size", Math.floor( Math.max( Math.min( ($(@el).width() / @compression), @maxFontSize ), @minFontSize ) )

  adjustOnLoad: ->
    $(window).on 'load', =>
      @resizeText()

  adjustOnResize: ->
    $(window).on 'resize', =>
      clearTimeout(delayedAdjust[@index])
      delayedAdjust[@index] = setTimeout(=>
        @resizeText()
      , 20)

  scrollOnHover: ->
    $(@el).css
      'overflow': 'hidden'
      'text-overflow': 'ellipsis'
      'white-space': 'nowrap'
    $(@el).hover (=>
      @difference = @el.scrollWidth - $(@el).width()
      @scrollSpeed = @difference if @difference > @scrollSpeed
      if @difference > 0
        $(@el).stop().animate
          "text-indent": -@difference
        , @scrollSpeed
    ), =>
      $(@el).stop().animate
        "text-indent": 0
      , @scrollReset


(($) ->

  responsiveTextElements = []

  $.fn.responsiveText = (options) ->

    @each ->
      responsiveTextElements.push( new ResponsiveText(@) )

      # $el.css "font-size", Math.floor(Math.max(Math.min($el.width() / ($el.data('compression')), parseFloat($el.data('max'))), parseFloat($el.data('min'))))

) jQuery
