class Ktra.Views.Form extends Backbone.Marionette.ItemView
  template: JST['templates/form']

  ui:
    'title': '#task_title'
    'radios': 'input[type=radio]'
    'wrapRadios': '.point-radio'
    'form': '.new_task'

  initialize: ->
    @model = new Ktra.Models.Task()

  onShow: ->
    @togglePointRadioButtons()

  events:
    'submit form': 'create'
    'keyup @ui.title': 'togglePointRadioButtons'
    'keypress input:not(.allow-submit)': 'ignore'
    'click input[type=radio]': 'create'

  create: (e) ->
    e.preventDefault()

    @model.set
      title: @ui.title.val()
      point: @$('input[type=radio]:checked').val()

    @model.save(wait: true).done =>
      @ui.title.val('')
      @ui.radios.prop(checked: false)
      @hidePointRadioButtons()
      @trigger 'task:created'
      @model = new Ktra.Models.Task()

  ignore: (e) ->
    e.which != 13

  togglePointRadioButtons: ->
    if @ui.title.val()
      @showPointRadioButtons()
    else
      @hidePointRadioButtons()

  showPointRadioButtons: ->
    @ui.wrapRadios.slideDown('fast', 'swing')

  hidePointRadioButtons: ->
    @ui.wrapRadios.hide('fast', 'swing')

  submit: ->
    @create()
