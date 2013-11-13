###
 *
 *  jQuery ResponsiveText by Gary Hepting - https://github.com/ghepting/jquery-responsive-text
 *  
 *  Open source under the MIT License. 
 *
 *  Copyright © 2013 Gary Hepting. All rights reserved.
 *
###

delayedAdjustText = []
responsiveTextIndex = 0

class ResponsiveText

  constructor: (el) ->
    @index = responsiveTextIndex++
    @el = el
    @$el = $(el)
    @compression = $(@el).data('compression') || 10
    @minFontSize = @$el.data('min') || Number.NEGATIVE_INFINITY
    @maxFontSize = @$el.data('max') || Number.POSITIVE_INFINITY
    @scrollable = @$el.data('scrollable') || false
    @scrollSpeed = @$el.data('scrollspeed') || 650
    @scrollReset = @$el.data('scrollreset') || 200
    @init()

  init: ->
    @adjustOnLoad()
    @adjustOnResize()
    @scrollOnHover() if @scrollable

  resizeText: ->
    @$el.css('font-size', '')
    @$copy = @$el.clone()
    @$copy.wrapInner('<span class="responsiveText-wrapper" style="white-space: nowrap;" />')
    @$el.before(@$copy)
    @originalWidth = @$copy.find('.responsiveText-wrapper').width()
    @$copy.remove()
    @containerWidth = @$el.width()
    @ratio = @containerWidth / @originalWidth
    @fontSize = parseInt( @$el.css('font-size') ) * @ratio - 1
    @$el.css "font-size", Math.floor( Math.max( Math.min( @fontSize, @maxFontSize ), @minFontSize ) )

  adjustOnLoad: ->
    $(window).on 'load', =>
      @resizeText()

  adjustOnResize: ->
    $(window).on 'resize', =>
      clearTimeout(delayedAdjustText[@index])
      delayedAdjustText[@index] = setTimeout(=>
        @resizeText()
      , 20)

  scrollOnHover: ->
    @$el.css
      'overflow': 'hidden'
      'text-overflow': 'ellipsis'
      'white-space': 'nowrap'
    @$el.hover =>
      @difference = @el.scrollWidth - @$el.width()
      @scrollSpeed = @difference if @difference > @scrollSpeed
      if @difference > 0
        @$el.css('cursor', 'e-resize')
        @$el.stop().animate
          "text-indent": -@difference
        , @scrollSpeed
        , =>
          @$el.css('cursor', 'text')
    , =>
      @$el.stop().animate
        "text-indent": 0
      , @scrollReset


(($) ->

  responsiveTextElements = []

  $.fn.responsiveText = (options) ->

    @each ->
      responsiveTextElements.push( new ResponsiveText(@) )

) jQuery
