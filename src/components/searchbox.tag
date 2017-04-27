import {search} from '../scripts/data.js'

<map-searchbox>

  <input type="text" oninput={ doSearch } class="cor-viz-st__search-input" />
  <ul if={ results.length > 0 } class="cor-viz-st__result-list">
    <li each={ results }
      class="cor-viz-st__result-item"
      onclick={ handleClick }>
      { name } - { stadt }
    </li>
  </ul>

  this.results = []

  this.doSearch = e => {
    const str = e.target.value.toLowerCase()
    if (str.length >= this.opts.config.threshold) {
      const results = search(str)
      if (results.length == 1) {
        riot.control.trigger(riot.EVT.mapJumpTo, results[0])
      } else {
        // this.update({results})
        this.results = results
      }
    } else {
      this.results = []
    }
  }

  this.handleClick = e => {
    this.results = []
    riot.control.trigger(riot.EVT.mapJumpTo, e.item)
  }

</map-searchbox>
