window.Backblog =
  Models: {}
  Collections: {}
  Views: {}
  Routers: {}
  init: -> 
    new Backblog.Routers.Posts()
    Backbone.history.start()

$(document).ready ->
  Backblog.init()
