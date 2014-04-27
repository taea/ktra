class Ktra.Routers.Main extends Backbone.Marionette.AppRouter
  controller: new Ktra.Controllers.Main()

  appRoutes:
    '': 'tasks'
    'tasks': 'tasks'
