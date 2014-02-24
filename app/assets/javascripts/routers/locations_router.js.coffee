class BackboneEsriMap.Routers.Locations extends Backbone.Router
  routes:
    '': 'index'

  initialize: ->
    @collection = new BackboneEsriMap.Collections.Locations()
    @collection.fetch({reset:true})

  index: ->
    view = new BackboneEsriMap.Views.LocationsIndex(collection: @collection)
    $('#container').html(view.render().el)
