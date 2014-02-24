pg = require 'pg'
CordBloodUnit = require './models/CordBloodUnit'
utils = require "./utils"

CONN_STRING = "postgres://pguruprasad@127.0.0.1:5432/jeevan"
GET_UNITS_QUERY = """SELECT id as "id", hla_a1 as "hlaA1", hla_a2 as "hlaA2", \
                    hla_b1 as "hlaB1", hla_b2 as "hlaB2", \
                    drb_1 as "drb1", drb_2 as "drb2", \
                    hla_c1 as "hlaC1", hla_c2 as "hlaC2", \
                    dqb_1 as "dqb1", dqb_2 as "dqb2" \
                    FROM cordbloodunits"""

LIMIT_CLAUSE = "LIMIT $1 OFFSET $2"
PAGE_SIZE = 10
ROW_COUNT_QUERY = "SELECT COUNT(*) FROM CORDBLOODUNITS"

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

  getUnits: ( page, perPage, offset, filter, cb) ->
    pg.connect CONN_STRING, (err, client, done) ->
      if err
        cb err
      whereclause = utils.whereClause(filter)

      query = "#{GET_UNITS_QUERY} #{whereclause} #{LIMIT_CLAUSE}"
      client.query query, [perPage, offset], (err, result) ->
        done() # return client to the pool
        if err
          throw err
        units = []
        for row in result.rows
          units.push new CordBloodUnit(row)
        cb(null, units)

  getRowCount: (callback) ->
    pg.connect CONN_STRING, (err, client, done) ->
      if err
        throw err

      client.query ROW_COUNT_QUERY, (err, result) ->
        done()
        if err
          throw err
        callback( null, parseInt(result.rows[0].count) )

module.exports = pgAdapter()