routes = (app) ->
  app.get '/login', (req, res) ->
    res.render "#{__dirname}/views/login"

  app.post '/sessions/new', (req, res) ->
    console.log("Username :: ", req.body.username)
    console.log("Password :: ", req.body.password)
    res.send("Received : " + req.body.username + " => " + req.body.password)

module.exports = routes