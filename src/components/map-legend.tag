<map-legend>

  <span class="cor-viz-st__legend-title">Standorttypen</span>
  <span each={ types }
    class="cor-viz-st__stype-badge cor-viz-st__stype-badge--{ modifier } cor-viz-st__stype-badge--small">
    { name }
  </span>

  const types = this.opts.types
  this.types = Object.keys(types).map((k, i) => {
    return {
      name: i+1,
      modifier: k
    }
  })

</map-legend>
