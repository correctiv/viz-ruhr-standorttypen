import initLeaflet from '../scripts/init_leaflet.js'
import addMapData from '../scripts/add_map_data.js'
import addMapEvents from '../scripts/add_map_events.js'

<leaflet-map>

  <div class="cor-viz-st__map-leaflet" id={ opts.elementId }></div>

  this.on('mount', () => {
    this.map = initLeaflet(this.opts)
    // this.map.on('click', () => riot.control.trigger(riot.EVT.clearMarker))
    this.featGroup = addMapData(this.map)
    this.map.fitBounds(this.featGroup.getBounds())
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
  })

  // riot.control.on(riot.EVT.clearInfobox, () => {
  //   riot.control.trigger(riot.EVT.clearMarker)
  // })

</leaflet-map>
