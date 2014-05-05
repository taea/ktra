#= require views/task
#= require views/empty_task
class Ktra.Views.Tasks extends Backbone.Marionette.CollectionView
  template: JST['templates/tasks']
  className: 'tasks-list'
  tagName: 'ul'

  itemView: Ktra.Views.Task
  emptyView: Ktra.Views.EmptyTask

  initialize: ->
    @listenTo @collection, 'reset', @render

  rebuild: (view) ->
    @collection = new Ktra.Collections.Tasks()
    @collection.fetch(reset: true)
      .done =>
        console.log @collection
        @render()
