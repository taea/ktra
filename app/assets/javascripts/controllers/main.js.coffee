class Ktra.Controllers.Main extends Marionette.Controller
  initialize: ->
    Ktra.Application.addRegions
      header: '.header'
      form: '.new-task'

    @user ?= new Ktra.Models.User()
    @user.fetch(reset: true).done =>
      headerView = new Ktra.Views.Header(model: @user)
      Ktra.Application.header.show(headerView)

  tasks: ->
    # TODO
    #tasksLayout = new Ktra.Layouts.Tasks()
    #Ktra.Application.main.show(tasksLayout)

    formView = new Ktra.Views.Form()
    Ktra.Application.form.show(formView)

    # TODO
    #tasksLayout.form.show(formView)

    # TODO
    #weekSummaryView = new Ktra.Views.WeekSummary()
    #tasksLayout.weekSummary.show(weekSummaryView)

    # TODO
    #@tasks = new Ktra.Collections.Tasks()
    #@tasks.fetch(reset: true).done =>
      #tasksLayout.tasks.show(tasksView)

  weeks: ->
    # TODO
    console.log 'weeeks'

  week: ->
    # TODO
    console.log 'week'
