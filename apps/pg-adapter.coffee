Pg = require 'pg'
CONN_STRING = "postgres://pguruprasad@127.0.0.1:5432/jeevan"

pgAdapter = () ->
  runQuery: (query, cb) ->
    Pg.connect CONN_STRING, (err, client, done) ->
      if err
        cb new Error "Error connectint to database", err
        return
      else
        client.query query, (err, result) ->
          done()
          debugger
          if err
            return cb err
          cb(null, result.rows)


module.exports = pgAdapter()