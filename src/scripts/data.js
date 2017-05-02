const getSearchString = ({name, stadt, street, plz}) => {
  return name.toLowerCase() + stadt.toLowerCase() + street.toLowerCase() + plz
}

const DATA = require('dsv!../data/standorttypen.csv').map(d => {
  d.search = getSearchString(d)
  return d
})

module.exports = {
  DATA,
  search: str => DATA.filter(d => d.search.indexOf(str) > -1)
}
