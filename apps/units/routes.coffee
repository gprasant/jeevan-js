CordBloodUnit = require "../models/CordBloodUnit"

units = (app, pgAdapter) ->
  app.get '/units/:page?', (req, res) ->
    page = parseInt(req.params.page || '1')
    # try ajax loading for dynatable.js
    # CordBloodUnit.getSamples page, (err, units) ->
    #   if err
    #     throw err
    #   res.render "#{__dirname}/views/list",
    #     units: units
    res.render "#{__dirname}/views/list",
      units: []

  app.get '/units.json/:page?', (req, res) ->
    page = parseInt(req.params.page || '1')
    pgAdapter.getUnits page, (err, units) ->
      pgAdapter.getRowCount (err, totalCount) ->
        result =
          "records": units
          "queryRecordCount": units.length
          "totalRecordCount": totalCount
        res.json result


  app.get '/test/:page?', (req, res) ->
    page = req.params.page || '42'
    res.end page

module.exports = units