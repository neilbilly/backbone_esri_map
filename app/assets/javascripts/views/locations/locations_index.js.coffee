class BackboneEsriMap.Views.LocationsIndex extends Backbone.View

  template: JST['locations/index']

  initialize: ->
    @collection.on('reset', @render, this)

  initial_map: ->
    collection =  @collection
    require [
      "esri/map", 
      "esri/geometry/Point", 
      "esri/SpatialReference", 
      "esri/symbols/SimpleMarkerSymbol", 
      "esri/graphic", 
      "esri/layers/GraphicsLayer",
      "dojo/_base/Color",
      "dojo/domReady!"
      ], (Map, Point, SpatialReference, SimpleMarkerSymbol, Graphic, GraphicsLayer, domConstruct)->

      map = new Map "map", { center: [-0.168060094999589, 51.5502901020005], zoom: 17, basemap: "streets"}

      show_point = (model) ->
        point = new Point(model.get('longitude'), model.get('latitude'))
        marker = new SimpleMarkerSymbol()
        marker.setColor(new dojo.Color([0,0,255]))
        graphic = new Graphic(point, marker)
        graphicsLayer = new GraphicsLayer()
        graphicsLayer.add(graphic)
        map.addLayer(graphicsLayer)
        graphicsLayer.on "click", ->
          map.infoWindow.setTitle("Location Info")
          map.infoWindow.setContent(model.get('address'))
          map.infoWindow.show(event.mapPoint)

      map.on "load", ->
        for model in collection.models
          show_point(model)

  render: ->
    $(@el).html(@template())
    @initial_map()
    this
