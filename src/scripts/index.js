'use strict'

if (module.hot) {
  module.hot.accept()
}

import 'babel-polyfill'
import '../styles/index.scss'

// events
import './riot_events.js'

// components
import '../components/leaflet-map.tag'
import '../components/infobox.tag'

// mount components
const CONFIG = require('json!../config.json')

riot.mount('[data-is-riot="leaflet-map"]', 'leaflet-map', CONFIG.leaflet)
riot.mount('[data-is-riot="map-infobox"]', 'map-infobox', CONFIG.infobox)
