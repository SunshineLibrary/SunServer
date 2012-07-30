#encoding UTF-8

# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

@TypeSelectBlock = 
  extended : false  
  showTypeSelect : ->
    # document.getElementById("typeSelect").style.display = "block"
    $("#typeSelect").css("display","block")
    $("#typeSelectButton").html("隐藏")  
    @extended = not @extended

$ -> (
  $(".best_in_place").best_in_place()
)

