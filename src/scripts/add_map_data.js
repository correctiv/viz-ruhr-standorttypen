import {DATA} from './data.js'

export default map => {
  const featGroup = L.featureGroup(DATA.map(d => {
    return L.circleMarker([+d.lat, +d.lon], {
      className: `l-marker__circle l-marker__circle--s${d.standorttyp}`,
      radius: 7,
      data: d
    })
  }))
  featGroup.addTo(map)
  return featGroup
}
