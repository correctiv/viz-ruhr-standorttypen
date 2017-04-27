const getSearchString = ({name, stadt, plz}) => name.toLowerCase() + stadt.toLowerCase() + plz

const DATA = require('dsv!../data/standorttypen.csv').map(d => {
  d.search = getSearchString(d)
  return d
})

module.exports = {
  DATA,
  search: str => DATA.filter(d => d.search.indexOf(str) > -1)
}
