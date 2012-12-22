# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

$(document).ready ->
  banner = 0
  total = $("#home-banner .banner").length
  if total > 1
    nextBunner = ->
      banner += 1
      if banner == total
        banner = 0
        
      $("#home-banner .banner").hide()
      $("#home-banner .banner:eq(#{banner})").fadeIn(5000)
      setTimmer()
      
    setTimmer = ->
      setTimeout(nextBunner, 10000)
    
    setTimmer()
  