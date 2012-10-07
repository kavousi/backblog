class Backblog.Views.PostsIndex extends Backbone.View

  template: JST['posts/index']

  events: 
    'click #new_post': 'newPost'

  initialize: ->
    @collection.on('reset', @render, this)

  render: ->
    $(@el).html(@template())
    @collection.each(@renderPostPreview)
    this
    
  renderPostPreview: (post) ->
    view = new Backblog.Views.PostPreview(model: post)
    @$('#posts').append(view.render().el)
    
  newPost: (event) ->
    event.preventDefault()
    Backbone.history.navigate("#posts/new", true)