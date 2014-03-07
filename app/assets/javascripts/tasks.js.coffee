jQuery ->
  window.Ktra ||= {}
  window.Ktra.tasks. = new Tasks

class Tasks
  constructor: ->
    @init()

  init: ->
    @listen()

  listen: ->
    @listen_focus()


  listen_focus: ->
    $(":text").focus ->
      $(this).next().hide()
    $(":text").focusout ->
      $(this).next().show()
