# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$ ()-> #onload
	showBtn = $('.show-definition')
	definition = $('.definition')
	showBtn.click ()->
		showBtn.hide()
		definition.show();