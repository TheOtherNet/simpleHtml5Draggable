// Generated by CoffeeScript 1.3.3
(function() {
  var SimpleHtml5DraggableResizable;

  SimpleHtml5DraggableResizable = (function() {

    function SimpleHtml5DraggableResizable(element_, options) {
      this.element_ = element_;
      this.options = $.extend({}, options);
      this.element = $(this.element_);
      this.init();
    }

    SimpleHtml5DraggableResizable.prototype.init = function() {
      this.do_resizable();
      return this.assign_events();
    };

    SimpleHtml5DraggableResizable.prototype.do_resizable = function() {
      this.element.data("width", this.element.css('width'));
      this.element.data("height", this.element.css('height'));
      return this.element = (($(this.element_)).wrap('<div class="resizable" data-offset="' + this.options.offset + '">')).parent();
    };

    SimpleHtml5DraggableResizable.prototype.assign_events = function() {
      var opt, _i, _len, _ref, _results;
      _ref = ['mouseover', 'drag', 'mouseout', 'dragstart', 'dragend', 'click'];
      _results = [];
      for (_i = 0, _len = _ref.length; _i < _len; _i++) {
        opt = _ref[_i];
        _results.push(this.element.on(opt, this[opt]));
      }
      return _results;
    };

    SimpleHtml5DraggableResizable.prototype.mouseover = function() {
      return ($(this)).toggleClass('selectedObject');
    };

    SimpleHtml5DraggableResizable.prototype.contextmenu = function(ev) {
      ($('#menu'))[0].dataset['currentTarget'] = $(ev.target).attr('id');
      ($('#menu')).css('top', ev.y - 35);
      ($('#menu')).css('left', ev.x - 300);
      ($('#menu')).show();
      return false;
    };

    SimpleHtml5DraggableResizable.prototype.mouseout = function() {
      return ($(this)).toggleClass('selectedObject');
    };

    SimpleHtml5DraggableResizable.prototype.dragstart = function(ev) {
      return this.style.opacity = 0.4;
    };

    SimpleHtml5DraggableResizable.prototype.drag = function(ev) {
      this.style.opacity = 0.4;
      this.style.left = ev.x + "px";
      this.style.top = ev.y + "px";
      return this.style.position = "absolute";
    };

    SimpleHtml5DraggableResizable.prototype.dragend = function(ev) {
      return this.style.opacity = 1;
    };

    return SimpleHtml5DraggableResizable;

  })();

  (function($) {
    return $.fn.simpleHtml5DraggableResizable = function(options) {
      var resizable;
      if (options == null) {
        options = {
          draggable: true
        };
      }
      return resizable = new SimpleHtml5DraggableResizable(this, options);
    };
  })($);

}).call(this);