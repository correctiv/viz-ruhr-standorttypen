import './searchbox.tag'
import './map-legend.tag'

<map-infobox>

  <map-searchbox config={ opts.searchbox }/>

  <div if={ data } class="cor-viz-st__infobox-data">
    <dl>
      <dt>{ data.name }</dt>
      <dd>Schule</dd>
      <dt>Standorttyp { data.standorttyp }</dt>
    </dl>
    <dl>
      <dt>{ data.street }</dt>
      <dd>Straße</dd>
    </dl>
  </div>

  <map-legend class="cor-viz-st__legend" />

  riot.control.on(riot.EVT.updateInfobox, data => {
    this.update({data})
  })

</map-infobox>
