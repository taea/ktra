class Ktra.Views.Task extends Backbone.Marionette.ItemView
  template: JST['templates/task']
  tagName: 'li'
  className: ->
    "task #{@model.get('status')} pt#{@model.get('point')}"

  events:
    'click a': 'edit'

  edit: ->
    alert "edit #{@model.get('title')}"
