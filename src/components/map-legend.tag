<map-legend>

  <h4 class="cpr-viz-st__legend-title">Standorttypen</h4>
  <ul class="cor-viz-st__legend-list">
    <li each={ types }
      class="cor-viz-st__stype-badge cor-viz-st__stype-badge--{ modifier } cor-viz-st__stype-badge--small">
      { name }
    </li>
  </ul>

  const types = this.opts.config.types
  this.types = Object.keys(types).map((k, i) => {
    return {
      name: i+1,
      modifier: k
    }
  })

</map-legend>
