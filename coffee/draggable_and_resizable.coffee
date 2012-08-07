#  Project: GrassCMS
#  Description: Draggable & resizable plugin, stripped from persistence plugin in grasscms
#  Author: David Francos Cuartero <david@theothernet.co.uk>
#  License: GPL 2+

class SimpleHtml5DraggableResizable
  constructor: (@element_, options) ->
    @options = $.extend {}, options
    @element = $ @element_
    @init()

  init: ->
    @do_resizable()
    @assign_events()

  do_resizable: ->
    @element.data  "width",  @element.css('width')
    @element.data  "height",  @element.css('height')
    @element = (($ @element_) .wrap '<div class="resizable" data-offset="' + @options.offset +  '">').parent()

  assign_events: ->
    @element.on opt, this[opt] for opt in [ 'mouseover', 'drag',
      'mouseout', 'dragstart',
      'dragend', 'click']

  mouseover: ->
    ($ this).toggleClass('selectedObject')

  contextmenu: (ev) ->
      ($ '#menu')[0] .dataset['currentTarget'] = $(ev.target).attr('id')
      ($ '#menu') .css 'top', ev.y - 35
      ($ '#menu') .css 'left', ev.x - 300
      ($ '#menu') .show()
      return false

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
