class Ktra.Views.Form extends Backbone.Marionette.ItemView
  template: JST['templates/form']

  ui:
    'title': '#task_title'
    'radios': '.point-radio'
    'form': '.new_task'

  initialize: ->
    @model = new Ktra.Models.Task()

  onShow: ->
    @togglePointRadioButtons()

  onRender: ->
    @stickit()

  events:
    'submit form': 'create'
    'keyup @ui.title': 'togglePointRadioButtons'
    'keypress input:not(.allow-submit)': 'ignore'
    'click input[type=radio]': 'create'

  bindings:
    '#task_title': 'title'
    'input[type=radio]': 'point'

  create: (e) ->
    e.preventDefault()
    console.log @model

    @model.save(wait: true).done =>
      @$(@ui.title).val('')
      @hidePointRadioButtons()

  ignore: (e) ->
    e.which != 13

  togglePointRadioButtons: ->
    if @$(@ui.title).val()
      @showPointRadioButtons()
    else
      @hidePointRadioButtons()

  showPointRadioButtons: ->
    @$(@ui.radios).slideDown('fast', 'swing')

  hidePointRadioButtons: ->
    @$(@ui.radios).hide()

  submit: ->
    @create()
