window.BackboneEsriMap =
  Models: {}
  Collections: {}
  Views: {}
  Routers: {}
  initialize: -> 
    new BackboneEsriMap.Routers.Locations()
    Backbone.history.start()

$(document).ready ->
  BackboneEsriMap.initialize()
