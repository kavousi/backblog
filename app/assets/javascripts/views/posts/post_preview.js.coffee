class Backblog.Views.PostPreview extends Backbone.View
  template: JST['posts/preview']
  tagName: 'li'
  
  events:
    'click': 'showPost'

  initialize: ->
    @model.on('change', @render, this)

  render: ->
    $(@el).html(@template(post: @model))
    this    

  showPost: ->
    Backbone.history.navigate("posts/#{@model.get('id')}", true)
    