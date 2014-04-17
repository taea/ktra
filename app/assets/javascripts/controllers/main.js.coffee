class Ktra.Controllers.Main extends Marionette.Controller
  initialize: ->
    Ktra.Application.addRegions
      header: '.header'
      form: '.new-task'
      footer: '.footer'

    @user ?= new Ktra.Models.User()
    @user.fetch(reset: true)
      .done =>
        headerView = new Ktra.Views.Header(model: @user)
        Ktra.Application.header.show(headerView)

    footerView = new Ktra.Views.Footer()
    Ktra.Application.footer.show(footerView)

  tasks: ->
    # TODO
    #formView = new Ktra.Views.Form()
    #Ktra.Application.form.show(formView)

  weeks: ->
    # TODO
    console.log 'weeeks'

  week: ->
    # TODO
    console.log 'week'
