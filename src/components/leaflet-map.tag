import initLeaflet from '../scripts/init_leaflet.js'
import addMapData from '../scripts/add_map_data.js'
import addMapEvents from '../scripts/add_map_events.js'
import '../components/reset-control.tag'

<leaflet-map>

  <div class="cor-viz-st__map-leaflet" id={ opts.elementId }>
    <reset-control class="cor-viz-st__reset-control" />
  </div>

  this.on('mount', () => {
    this.map = initLeaflet(this.opts)
    this.featGroup = addMapData(this.map)
    this.bounds = this.featGroup.getBounds()
    this.resetMap()
    addMapEvents(this.featGroup)
  })

  riot.control.on(riot.EVT.mapJumpTo, data => {
    const coords = [data.lat, data.lon]
    this.map.setView(coords, 14)
    riot.control.trigger(riot.EVT.setMarker, coords)
    riot.control.trigger(riot.EVT.updateInfobox, data)
  })

  riot.control.on(riot.EVT.setMarker, coords => {
    const m = riot.STATE.currentMarker
    if (m) {
      m.setLatLng(coords)
    } else {
      riot.STATE.currentMarker = L.marker(coords).addTo(this.map)
    }
  })

  riot.control.on(riot.EVT.clearMarker, () => {
    const m = riot.STATE.currentMarker
    m && this.map.removeLayer(m)
    riot.STATE.currentMarker = null
  })

  riot.control.on(riot.EVT.resetMap, () => {
    this.resetMap()
  })

  this.resetMap = () => {
    this.map.fitBounds(this.bounds)
    riot.control.trigger(riot.EVT.clearMarker)
    riot.control.trigger(riot.EVT.clearInfobox)
    riot.control.trigger(riot.EVT.clearResults)
  }
  // riot.control.on(riot.EVT.clearInfobox, () => {
  //   riot.control.trigger(riot.EVT.clearMarker)
  // })

</leaflet-map>
