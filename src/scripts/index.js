'use strict'

if (module.hot) {
  module.hot.accept()
}

// import 'babel-polyfill'
import './polyfills/array-find.js'

import '../styles/index.scss'

// events
import './riot_events.js'

// components
import '../components/leaflet-map.tag'
import '../components/infobox.tag'
import '../components/multi-bars.tag'

const CONFIG = require('json!../config.json')
CONFIG.multiBars.types = CONFIG.leaflet.types = CONFIG.infobox.types  // FIXME

// mount components
riot.mount('[data-is-riot="leaflet-map"]', 'leaflet-map', CONFIG.leaflet)
riot.mount('[data-is-riot="map-infobox"]', 'map-infobox', CONFIG.infobox)
riot.mount('[data-is-riot="small-multi-bars"]', 'multi-bars', CONFIG.multiBars)
