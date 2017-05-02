const getSearchString = ({name, stadt, street, plz}) => {
  return name.toLowerCase() + stadt.toLowerCase() + street.toLowerCase() + plz
}

const DATA = require('dsv!../data/standorttypen.csv').map(d => {
  d.search = getSearchString(d)
  return d
})

const BARS_DATA = {}
require('dsv!../data/rvr_districts.csv').map(d => BARS_DATA[d.name] = d)

module.exports = {
  DATA,
  BARS_DATA,
  search: str => DATA.filter(d => d.search.indexOf(str) > -1)
}
