window.Ktra =
  Models: {}
  Collections: {}
  Controllers: {}
  Layouts: {}
  Views: {}
  Routers: {}
  initialize: ->
    Ktra.Application = new Backbone.Marionette.Application()
    Ktra.Application.addInitializer -> Backbone.history.start()
    Ktra.Application.addInitializer -> new Ktra.Routers.Main()
    Ktra.Application.start()

$(document).ready ->
  Ktra.initialize()
