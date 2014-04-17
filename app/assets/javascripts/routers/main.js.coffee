class Ktra.Routers.Main extends Backbone.Marionette.AppRouter
  initialize: ->
    @controller = new Ktra.Controllers.Main()
    @controller.tasks()

  appRoutes:
    '': 'tasks'
    'weeks': 'weeks'
    'weeks/:id': 'week'

