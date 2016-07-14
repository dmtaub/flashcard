# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

ready = -> #onload
	console.log "LOAD!"
	showBtn = $('.show-definition')
	definition = $('.definition')
	showBtn.click ()->
		showBtn.hide()
		definition.show();

$(document).on('turbolinks:load', ready)
