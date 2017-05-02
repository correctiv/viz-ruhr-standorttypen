import {BARS_DATA} from '../scripts/data.js'
import './multi-bars__legend.tag'

<multi-bars>

  <multi-bars-legend class="multi-bars__legend" types={ opts.types } />

  <div class="multi-bars__table">
    <div each={ data } class="multi-bars__row">
      <div class="multi-bars__cell multi-bars__cell--label">
        <strong>{ name }</strong><br>
          <span class="annotation">{ total } Schulen</span>
      </div>
      <div class="multi-bars__chart">
        <div each={ bars }
          if={ value }
          class="multi-bars__bar multi-bars__bar--{ modifier }"
          style="width:{ width }%;">
          <div class="multi-bars__bar-label">{ Math.round(width) }<span
              if={ width > 5 }
              class={ getClass(width) }>&nbsp;%</span></div>
        </div>
      </div>
    </div>
  </div>

  this.keys = ['s1', 's2', 's3', 's4', 's5']
  this.data = this.opts.districts.map(d => {
    const data = BARS_DATA[d]
    return {
      name: d,
      bars: this.keys.map(k => {
        if (+data[k]) {
          return {
            modifier: k,
            width: +data[k] / +data.total * 100,
            value: +data[k]
          }
        }
      }),
      total: data.total
    }
  })

  this.sortData = key => {
    this.update({
      data: this.data.sort((a, b) => this._compare(key, a, b))
    })
  }

  this.resetSortData = () => {
    this.update({
      data: this.opts.districts.map(d => {
        return this.data.find(i => i.name === d)
      })
    })
  }

  riot.control.on(riot.EVT.multiBarsReset, () => {
    this.resetSortData()
  })

  riot.control.on(riot.EVT.multiBarsOrderBy, key => {
    this.sortData(key)
  })

  this.getClass = width => {
    return width < 10 ? '--hide-md' : width < 15 ? '--hide-sm' : ''
  }

  this._compare = (key, a, b) => {
    return this._getValue(key, b.bars) - this._getValue(key, a.bars)
  }

  this._getValue = (key, bars) => {
    const bar = bars.find(b => b && b.modifier === key)
    return bar && bar.width || -1
  }

</multi-bars>
