class Backblog.Views.PostShow extends Backbone.View

  template: JST['posts/show']

  events:
    'click #edit_post': 'editPost'
    'click #delete_post': 'deletePost'

  initialize: ->
    @model.on('change', @render, this)

  render: ->
    $(@el).html(@template(post: @model))
    this
  
  editPost: (event) ->
    event.preventDefault()
    Backbone.history.navigate("#posts/#{@model.get('id')}/edit", true)
    
  deletePost: (event) ->
    event.preventDefault()
    if confirm 'Are you sure you want to delete this post?'
      @model.destroy
        wait: true
        success: -> Backbone.history.navigate("#", true)        
        error: (post, response) ->
          errors = $.parseJSON(response.responseText).errors
          for attribute, messages of errors
            alert "#{attribute} #{message}" for message in messages