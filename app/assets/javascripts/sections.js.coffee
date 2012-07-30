#encoding UTF-8

# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

@TypeSelectBlock = 
  extended : false  
  showTypeSelect : ->
    if @extended
      # duplicated code, but dont' know how to reduce...
      $("#newQuizActivityForm").css("display", "none")
      $("#newVideoActivityForm").css("display", "none")
      $("#newGalleryActivityForm").css("display", "none")
      $("#newTextActivityForm").css("display", "none")
      $("#newAudioActivityForm").css("display", "none")
      $("#newHtmlActivityForm").css("display", "none")
      
      $("#typeSelect").css("display", "none")
      $("#typeSelectButton").html("添加新的环节")
    else
      $("#typeSelect").css("display","block")
      $("#typeSelectButton").html("隐藏")  
    @extended = not @extended
  
@switchView= (type) ->
  # smelly duplicated code
  $("#newQuizActivityForm").css("display", "none")
  $("#newVideoActivityForm").css("display", "none")
  $("#newGalleryActivityForm").css("display", "none")
  $("#newTextActivityForm").css("display", "none")
  $("#newAudioActivityForm").css("display", "none")
  $("#newHtmlActivityForm").css("display", "none")
      
  switch type
    when 1 then $("#newTextActivityForm").css("display", "block")
    when 2 then $("#newQuizActivityForm").css("display", "block")
    when 3 then $("#newVideoActivityForm").css("display", "block")
    when 4 then $("#newGalleryActivityForm").css("display", "block")
    when 5 then $("#newAudioActivityForm").css("display", "block")
    when 6 then $("#newHtmlActivityForm").css("display", "block") 
  
$ -> (
  $(".best_in_place").best_in_place()
)

