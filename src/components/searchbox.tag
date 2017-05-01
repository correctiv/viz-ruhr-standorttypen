import {search} from '../scripts/data.js'

<map-searchbox>

  <input type="text"
    oninput={ doSearch } class="cor-viz-st__search-input"
    placeholder="Suche..."
  />
  <span if={ !results.length && showAnnotation } class="cor-viz-st__search-annotation">Gib den Namen Deiner Schule, Stadt oder eine Postleitzahl ein.</span>
  <ul if={ results.length } class="cor-viz-st__result-list">
    <li each={ results }
      class="cor-viz-st__result-item"
      onclick={ handleClick }>
      { name }<br><span>{ stadt }</span>
    </li>
  </ul>

  this.results = []
  this.showAnnotation = true

  this.doSearch = e => {
    const str = e.target.value.toLowerCase()
    if (str.length >= this.opts.config.threshold) {
      const results = search(str)
      if (results.length == 1) {
        this.clearResults()
        riot.control.trigger(riot.EVT.mapJumpTo, results[0])
      } else {
        riot.control.trigger(riot.EVT.clearInfobox)
        this.update({results})
      }
    } else {
      this.clearResults()
    }
  }

  this.handleClick = e => {
    this.clearResults()
    riot.control.trigger(riot.EVT.mapJumpTo, e.item)
  }

  this.clearResults = () => {
    this.update({results: []})
  }

  riot.control.on(riot.EVT.clearResults, () => {
    this.clearResults()
  })

  riot.control.on(riot.EVT.updateInfobox, () => {
    this.update({showAnnotation: false})
  })

</map-searchbox>
