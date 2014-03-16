jQuery ->
  window.Ktra ||= {}
  window.Ktra.tasks = new Tasks

class Tasks
  constructor: ->
    @init()

  init: ->
    @listen()

  listen: ->
    @listen_focus()
    @listen_submit()


  listen_focus: ->
    $(":text").focus ->
      $(this).next().hide()
    $(":text").focusout ->
      $(this).next().show()
    $(".new-task").find(".point-radio").hide()
    $(".new-task").find(":text").focusout ->
      newTaskVal = $(".new-task").find(":text").val()
      if newTaskVal != ''
        $(".new-task .point-radio").slideDown("fast", "swing")

  listen_submit: ->
    $(".point-radio").find("input").on 'click', ->
      newTaskForm = $(".new-task").find("form")
      $(newTaskForm).attr("action", "/tasks")
      $(newTaskForm).submit()
