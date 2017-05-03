# viz-ruhr-standorttypen

Explore data about school classification in some parts of North-Rhine Westphalia.

[See published story at correctiv.org (in german)](https://correctiv.org/blog/ruhr/artikel/2017/05/03/schulen-herne-und-gelsenkirchen-kaempfen-mit-den-groessten-problemen/)

[See preview of this viz via gh-pages](https://correctiv.github.io/viz-ruhr-standorttypen/dist/)

Based on [wbkd/yet-another-webpack-es6-starterkit](https://github.com/wbkd/yet-another-webpack-es6-starterkit)

Uses [leaflet](https://leafletjs.com) and [riotjs](https://riotjs.com)

Two viz available:
- leaflet data exploration map
- table of stacked bars for cities

## base visualization setup for correctiv cms

### javascript

```
dist/bundle.js
```

### styles

```
dist/styles/bundle.css
```

## for use in correctiv cms plugins:

### leaflet exploration map

#### html

```html
<figure class="figure -full-width">
  <h2>Standorttypen von ausgewählten weiterführenden Schulen in NRW</h2>
  <div class="figure__container">
    <section class="cor-viz-st__section">
      <div class="cor-viz-st__map-container" data-is-riot="leaflet-map"></div>
      <div class="cor-viz-st__info-container" data-is-riot="map-infobox"></div>
    </section>
  </div>
</figure>
<div class="figure__credits">
  <p><strong>Daten:</strong> <a href="">Data Source</a>, eigene Berechnungen, gerundet.</p>
</div>
```

### cities table

#### html

```html
<figure class="figure -full-width">
  <h2>Standorttypen der Schulen in den Ruhrgebietsstädten</h2>
  <div class="figure__container">
    <section class="cor-viz-st__section">
      <div class="cor-viz-st__multi-bars-container" data-is-riot="small-multi-bars"></div>
    </section>
  </div>
</figure>
<div class="figure__credits">
  <p><strong>Daten:</strong> <a href="">Data Source</a>, eigene Berechnungen, gerundet.</p>
</div>
```


## Development

### Installation

```
npm install
```

### Start Dev Server

```
npm run dev
```

### Build Prod Version

```
npm run build
```

### Features:

* ES6 Support via [babel-loader](https://github.com/babel/babel-loader)
* SASS Support via [sass-loader](https://github.com/jtangelder/sass-loader)
* Linting via [eslint-loader](https://github.com/MoOx/eslint-loader)
* Hot Module Replacement

When you run `npm run build` we use the [extract-text-webpack-plugin](https://github.com/webpack/extract-text-webpack-plugin) to move the css to a separate file and included in the head of your `index.html`, so that the styles are applied before any javascript gets loaded. We disabled this function for the dev version, because the loader doesn't support hot module replacement.
