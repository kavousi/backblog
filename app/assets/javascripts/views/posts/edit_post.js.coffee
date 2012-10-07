class Backblog.Views.EditPost extends Backbone.View
  template: JST['posts/edit']

  # initialize: ->
    # @model = new Backblog.Models.Post()

  events:
    'submit': 'savePost'

  render: ->
    $(@el).html(@template(post: @model))
    this

  savePost: (event) ->
    event.preventDefault()
    id = @model.get('id')
    attributes =
      title: @$('#post_title').val()
      content: @$('#post_content').val()
    @model.save attributes,
      wait: true
      success: ->
        Backbone.history.navigate("posts/#{id}", true)
      error: @handleError
      
  handleError: (post, response) ->
    if response.status == 422
      errors = $.parseJSON(response.responseText).errors
      for attribute, messages of errors
        alert "#{attribute} #{message}" for message in messages