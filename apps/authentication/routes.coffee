routes = (app) ->
  app.get '/login', (req, res) ->
    res.render "#{__dirname}/views/login"

  app.post '/sessions', (req, res) ->
    if ("admin" is req.body.username and "geeone" is req.body.password)
      req.cookies.username = req.body.username
      res.redirect "/units"
    else
      req.session.messages = [ { "type": "err",  "message": "Incorrect username / password . Please try again." } ]
      res.redirect "/login"

module.exports = routes