# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
$(document).ready ->
  $('[data-hide]').click ->
      e = $('.' + $(@).data('hide'))
      if $(@).hasClass('visible')
        $(@).removeClass('visible')
        e.slideUp();
      else
        $(@).addClass('visible')
        e.addClass('visible').slideDown();
  