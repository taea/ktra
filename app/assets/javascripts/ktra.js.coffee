window.Ktra =
  Models: {}
  Collections: {}
  Controllers: {}
  Layouts: {}
  Views: {}
  Routers: {}
  Application: new Backbone.Marionette.Application()
  initialize: ->
    Ktra.Application.addInitializer ->
      new Ktra.Routers.Main()
      Backbone.history.start()
    Ktra.Application.start()

