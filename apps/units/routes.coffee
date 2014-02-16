CordBloodUnit = require "../models/CordBloodUnit"

units = (app, pgAdapter) ->
  app.get '/units/:page?', (req, res) ->
    page = parseInt(req.params.page || '1')
    CordBloodUnit.getSamples page, (err, units) ->
      res.render "#{__dirname}/views/list",
        units: units

  app.get '/units.json/:page?', (req, res) ->
    page = parseInt(req.params.page || '1')
    pgAdapter.getUnits page, (err, units) ->
      res.json units


  app.get '/test/:page?', (req, res) ->
    page = req.params.page || '42'
    res.end page

module.exports = units