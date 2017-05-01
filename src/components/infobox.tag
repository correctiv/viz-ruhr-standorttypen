import './searchbox.tag'
import './map-legend.tag'

<map-infobox>

  <map-searchbox config={ opts.searchbox }/>

  <div if={ data } class="cor-viz-st__infobox-data">
    <dl>
      <dt>{ data.name }</dt>
      <dd>{ data.schulform }<br>
          { data.street }<br>
          { data.plz } { data.stadt }
      </dd>
      <dt>Standorttyp: <span class="cor-viz-st__stype-badge cor-viz-st__stype-badge--s{ data.standorttyp }">{ data.standorttyp }</span></dt>
    </dl>
    <div class="well">
      <div class="cor-viz-st__stype-info">
        <p><strong>Standorttyp { data.standorttyp } bedeutet:</strong><br>
            { getTypeDesc(data.standorttyp) }
        </p>
      </div>
    </div>
  </div>

  <map-legend class="cor-viz-st__legend" types={ opts.types } />

  riot.control.on(riot.EVT.updateInfobox, data => {
    this.update({data})
  })

  riot.control.on(riot.EVT.clearInfobox, () => {
    this.update({data: null})
  })

  this.getTypeDesc = id => {
    return this.opts.types[`s${id}`].desc
  }

</map-infobox>
