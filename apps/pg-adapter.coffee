pg = require 'pg'
CordBloodUnit = require './models/CordBloodUnit'
PAGE_SIZE = 15
CONN_STRING = "postgres://pguruprasad@127.0.0.1:5432/jeevan"

GET_UNITS_QUERY = """SELECT hla_a1 as "hlaA1", hla_a2 as "hlaA2", \
                    hla_b1 as "hlaB1", hla_b2 as "hlaB2", \
                    hla_c1 as "hlaC1", hla_c2 as "hlaC2", \
                    drb_1 as "drb1", drb_2 as "drb2", \
                    dqb_1 as "dqb1", dqb_2 as "dqb2"
                    FROM cordbloodunits LIMIT $1 OFFSET $2"""

pgAdapter = () ->
  runQuery: (query, cb) ->
    pg.connect CONN_STRING, (err, client, done) ->
      if err
        cb err
        return
      else
        client.query query, (err, result) ->
          done()
          if err
            return cb err
          cb(null, result.rows)

  getUnits: ( page, cb) ->
    offset_count = PAGE_SIZE * (page - 1)
    pg.connect CONN_STRING, (err, client, done) ->
      if err
        cb err
      client.query GET_UNITS_QUERY, [PAGE_SIZE, offset_count], (err, result) ->
        done() # return client to the pool
        if err
          return cb err
        units = []
        for row in result.rows
          units.push new CordBloodUnit(row)
        cb(null, units)


module.exports = pgAdapter()