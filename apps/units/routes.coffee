CordBloodUnit = require "../models/CordBloodUnit"

units = (app, pgAdapter) ->
  app.get '/units/:page?', (req, res) ->
    page = parseInt(req.params.page || '1')
    res.render "#{__dirname}/views/list",
      units: []

  app.get '/units.json/:page?', (req, res) ->
    offset = parseInt( req.query.offset || '0' )
    page = parseInt(req.params.page || req.query.page || '1')
    perPage = parseInt( req.query.perPage || '10')

    pgAdapter.getUnits page, perPage, offset, (err, units) ->
      pgAdapter.getRowCount (err, totalCount) ->
        result =
          "records": units
          "queryRecordCount": totalCount # for now, since filtering is not yet implemented.
          "totalRecordCount": totalCount
        res.json result

module.exports = units