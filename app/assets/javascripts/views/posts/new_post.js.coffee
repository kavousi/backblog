class Backblog.Views.NewPost extends Backbone.View
  template: JST['posts/new']

  initialize: ->
    @model = new Backblog.Models.Post()

  events:
    'submit': 'addPost'

  render: ->
    $(@el).html(@template())
    this

  addPost: (event) ->
    event.preventDefault()
    attributes =
      title: @$('#new_post_title').val()
      content: @$('#new_post_content').val()
    @model.save attributes,
      wait: true
      success: =>
        Backbone.history.navigate("posts/#{@model.get('id')}", true)
      error: @handleError
      
  handleError: (post, response) ->
    if response.status == 422
      errors = $.parseJSON(response.responseText).errors
      for attribute, messages of errors
        alert "#{attribute} #{message}" for message in messages