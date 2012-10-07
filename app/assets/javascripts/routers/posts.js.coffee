class Backblog.Routers.Posts extends Backbone.Router
  routes:
    '': 'index'
    'posts/new': 'new'
    'posts/:id': 'show'
    'posts/:id/edit': 'edit'

  initialize: ->
    @collection = new Backblog.Collections.Posts()
    @collection.fetch()

  index: ->
    view = new Backblog.Views.PostsIndex(collection: @collection)
    $('#container').html(view.render().el)

  new: ->
    view = new Backblog.Views.NewPost()
    $('#container').html(view.render().el)


  show: (id) ->
    post = new Backblog.Models.Post({id: id})
    post.fetch
      success: -> 
        view = new Backblog.Views.PostShow(model: post)
        $('#container').html(view.render().el)

   edit: (id) ->
     post = new Backblog.Models.Post({id: id})
     post.fetch
       success: -> 
         view = new Backblog.Views.EditPost(model: post)
         $('#container').html(view.render().el)