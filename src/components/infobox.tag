import './searchbox.tag'
import './map-legend.tag'

<map-infobox>

  <map-searchbox config={ opts.searchbox }/>

  <div if={ data } class="cor-viz-st__infobox-data">
    <dl>
      <dt>{ data.name }</dt>
      <dd>Schule</dd>
      <dt>{ data.schulform }</dt>
      <dd>Schulform</dd>
      <dt>Standorttyp: <span class="cor-viz-st__stype cor-viz-st__stype--s{ data.standorttyp }">{ data.standorttyp }</span></dt>
    </dl>
    <dl>
      <dt>{ data.street }</dt>
      <dd>Straße</dd>
      <dt>{ data.plz } { data.stadt }</dt>
      <dd>PLZ, Ort</dd>
    </dl>
  </div>

  <map-legend class="cor-viz-st__legend" />

  riot.control.on(riot.EVT.updateInfobox, data => {
    this.update({data})
  })

</map-infobox>
