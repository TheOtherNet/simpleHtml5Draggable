#  Project: GrassCMS
#  Description: Draggable & resizable plugin, stripped from persistence plugin in grasscms
#  Author: David Francos Cuartero <david@theothernet.co.uk>
#  License: GPL 2+

class SimpleHtml5DraggableResizable
  constructor: (@element_, options) ->
    @options = $.extend {}, options
    @element = $ @element_
    @element = (($ @element_) .wrap '<div class="resizable">').parent()
    @element.on opt, this[opt] for opt in [ 'mouseover', 'drag',
      'mouseout', 'dragstart',
      'dragend']

  mouseover: ->
    ($ this).toggleClass('selectedObject')

  mouseout: ->
    ($ this).toggleClass('selectedObject')

  dragstart: (ev) ->
    this.style.opacity = 0.4

  drag: (ev) ->
    this.style.opacity = 0.4
    this.style.left=ev.x + "px"
    this.style.top=ev.y + "px"
    this.style.position = "absolute"

  dragend: (ev) ->
    this.style.opacity = 1

do ($) ->
  $.fn.simpleHtml5DraggableResizable = (options = draggable:true) ->
    resizable = new SimpleHtml5DraggableResizable(@, options)
