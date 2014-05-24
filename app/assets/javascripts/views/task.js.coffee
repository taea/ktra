class Ktra.Views.Task extends Backbone.Marionette.ItemView
  template: JST['templates/task']
  tagName: 'li'
  className: ->
    "task #{@model.get('status')} pt#{@model.get('point')}"

  ui:
    headerForm: '.form-header form'
    form: ''

  events:
    'click a': 'edit'

  initialize: ->
    @listenTo @model, 'active', @showEditForm
    @listenTo @model, 'hide', @hideEditForm

  edit: ->
    if @model.get('active')
      @model.trigger('hide')
    else
      @model.trigger('active')

  showEditForm: ->
    $.when
    @model.set active: true
    @$('.edit').slideDown('fast')
    @$('.edit').promise().done =>
      @$('.edit').addClass('active')

  hideEditForm: ->
    @model.set active: false
    @$('.edit').hide('fast')
    @$('.edit').promise().done =>
      @$('.edit').removeClass('active')
