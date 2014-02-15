units = (app, pgAdapter) ->
  app.get '/units', (req, res) ->
    res.render "#{__dirname}/views/list"

  app.get '/units.json/:page?', (req, res) ->
    page = parseInt(req.params.page || '1')
    pgAdapter.getUnits 15, page, (err, units) ->
      res.json units


  app.get '/test/:page?', (req, res) ->
    page = req.params.page || '42'
    res.end page

module.exports = units