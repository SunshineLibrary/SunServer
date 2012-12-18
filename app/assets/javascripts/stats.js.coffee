#encoding UTF-8

# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/


load_list = (div, action, key, val) ->
  params = {}
  params[key] = val
  $("select##{div}").load "#{action}", params

$ -> (
  load_list "classroom_id", "get_classrooms_from_school", "school_id", $("#school").val()
  load_list "section_id", "get_sections_from_course", "course_id", $("#course").val()
)

$("#school").live "change", ->
  load_list "classroom_id", "get_classrooms_from_school", "school_id", $(this).val()

$("#course").live "change", ->
  load_list "section_id", "get_sections_from_course", "course_id", $(this).val()