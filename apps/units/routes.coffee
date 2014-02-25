CordBloodUnit = require "../models/CordBloodUnit"
utils = require "../utils"

units = (app, pgAdapter) ->
  app.get '/units/:page?', (req, res, next) ->
    if not req.session.currentUser
      req.session.messages = [
        "type": "error",
        "message": "You should log in to continue"
      ]
      res.redirect '/login'
      return
    next()

  app.get '/units/:page?', (req, res) ->
    page = parseInt(req.params.page || '1')
    res.render "#{__dirname}/views/list",
      units: []

  app.get '/units.json/:page?', (req, res) ->
    offset = parseInt( req.query.offset || '0' )
    page = parseInt(req.params.page || req.query.page || '1')
    perPage = parseInt( req.query.perPage || '10')

    filter = utils.numberize( req.query.queries ) || {}

    pgAdapter.getUnits page, perPage, offset, filter,  (err, units) ->
      pgAdapter.getRowCount filter, (err, totalCount, filterCount) ->
        result =
          "records": units
          "queryRecordCount": filterCount
          "totalRecordCount": totalCount
        res.json result

module.exports = units