#encoding UTF-8

# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/



@switchView= (type) ->
  # smelly duplicated code
  $("#newQuizActivityForm").css("display", "none")
  $("#newVideoActivityForm").css("display", "none")
  $("#newGalleryActivityForm").css("display", "none")
  $("#newTextActivityForm").css("display", "none")
  $("#newAudioActivityForm").css("display", "none")
  $("#newHtmlActivityForm").css("display", "none")
      
  switch type
    when 'text' then $("#newTextActivityForm").css("display", "block")
    when 'quiz' then $("#newQuizActivityForm").css("display", "block")
    when 'video' then $("#newVideoActivityForm").css("display", "block")
    when 'gallery' then $("#newGalleryActivityForm").css("display", "block")
    when 'audio' then $("#newAudioActivityForm").css("display", "block")
    when 'html' then $("#newHtmlActivityForm").css("display", "block") 
