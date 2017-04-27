export default ({
  elementId,
  tileLayer,
  attribution,
  minZoom,
  maxZoom
}) => {
  const map = L.map(elementId)
  L.tileLayer(tileLayer, {
    attribution,
    minZoom,
    maxZoom
  }).addTo(map)
  return map
}
