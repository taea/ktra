class Ktra.Layouts.Tasks extends Backbone.Marionette.Layout
  template: JST['templates/layouts/tasks']
  regions:
    form: '.new-task'
    tasks: '.tasks'

  onShow: ->
    formView = new Ktra.Views.Form()
    @form.show(formView)

    @collection = new Ktra.Collections.Tasks()
    @collection.fetch(reset: true).done =>
      tasksView = new Ktra.Views.Tasks(collection: @collection)
      @tasks.show(tasksView)
