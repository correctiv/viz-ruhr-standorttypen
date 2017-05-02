<multi-bars-legend>

  <h4>Standorttypen</h4>
  <p class="small">Sortiere diese Tabelle nach dem Anteil der Schulen eines bestimmten Standorttyps</p>
  <button each={ types }
    onclick={ orderBy }
    class="multi-bars__button { multi-bars__button--active: active === modifier } cor-viz-st__stype-badge cor-viz-st__stype-badge--{ modifier }">
    { name }
  </button>
  <button class="multi-bars__reset-button btn"
    onclick={ reset }>Auswahl zurücksetzen
  </button>

  this.active = null

  const types = this.opts.types
  this.types = Object.keys(types).map((k, i) => {
    return {
      name: i+1,
      modifier: k
    }
  })

  this.orderBy = e => {
    this.active = e.item.modifier
    riot.control.trigger(riot.EVT.multiBarsOrderBy, this.active)
  }

  this.reset = () => {
    this.active = null
    riot.control.trigger(riot.EVT.multiBarsReset)
  }

</multi-bars-legend>
