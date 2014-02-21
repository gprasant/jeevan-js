routes = (app) ->
  app.get '/login', (req, res) ->
    res.render "#{__dirname}/views/login"

  app.post '/sessions/new', (req, res) ->
    if ("admin" is req.body.username and "geeone" is req.body.password)
      req.cookies.username = req.body.username
      res.redirect "/units"
    else
      res.redirect "/login"

module.exports = routes