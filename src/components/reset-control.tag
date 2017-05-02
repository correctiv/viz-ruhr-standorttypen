<reset-control>

  <button
    onclick={ resetMap }
    class="cor-viz-st__reset-control-button btn">
    Ansicht zurücksetzen
  </button>

  this.resetMap = () => {
    riot.control.trigger(riot.EVT.resetMap)
  }

</reset-control>
