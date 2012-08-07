# Makefile for simpleHtml5Draggable persistence plugin

all: build compress

compress:
	yui-compressor --type js $(dir_)js/simpleHtml5Draggable.js > $(dir_)js/simpleHtml5Draggable.min.js
	yui-compressor --type css $(dir_)css/simpleHtml5Draggable.css > $(dir_)css/simpleHtml5Draggable.min.css

build: dirs
	coffee --join $(dir_)js/simpleHtml5Draggable.js --compile coffee/*.coffee
	lessc less/main.less $(dir_)css/simpleHtml5Draggable.css

dirs:
	@mkdir $(dir_)js $(dir_)css &>/dev/null

clean:
	rm -rf css/simpleHtml5Draggable.css css/simpleHtml5Draggable.min.css js/simpleHtml5Draggable.js js/simpleHtml5Draggable.min.js

.PONY: clean build compress all
