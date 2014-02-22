routes = (app) ->
  app.get '/login', (req, res) ->
    if req.session.currentUser
      req.session.messages = [
        "type" : "info",
        "message": "You are already logged in."
      ]
      res.redirect "/units"
      return
    res.render "#{__dirname}/views/login"

  app.post '/sessions', (req, res) ->
    if ("admin" is req.body.username and "geeone" is req.body.password)
      req.session.messages = [
        "type" : "info",
        "message": "You have been logged in."
      ]
      req.session.currentUser = req.body.username
      res.redirect "/units"
    else
      req.session.messages = [ { "type": "err",  "message": "Incorrect username / password . Please try again." } ]
      res.redirect "/login"

module.exports = routes