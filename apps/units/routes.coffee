units = (app) ->
  app.get '/units', (req, res) ->
    res.render "#{__dirname}/views/list"
module.exports = units