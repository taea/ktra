class Ktra.Controllers.Main extends Marionette.Controller
  initialize: ->
    Ktra.Application.addRegions
      header: '.header'
      form: '.new-task'
      tasks: '.tasks'

    @user ?= new Ktra.Models.User()
    @user.fetch(reset: true).done =>
      headerView = new Ktra.Views.Header(model: @user)
      Ktra.Application.header.show(headerView)

  tasks: ->
    formView = new Ktra.Views.Form()
    Ktra.Application.form.show(formView)

    @tasks = new Ktra.Collections.Tasks()

    @tasks.fetch(reset: true).done =>
      tasksView = new Ktra.Views.Tasks(collection: @tasks)
      Ktra.Application.tasks.show(tasksView)

      tasksView.listenTo formView, 'task:created', tasksView.rebuild
