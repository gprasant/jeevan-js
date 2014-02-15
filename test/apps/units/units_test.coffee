require "should"
assert = require "assert"
request = require "request"
express = require "express"
bond = require "bondjs"

describe 'UnitsController', ->
  [app, server] = [null, null]
  before () ->
    app = express()
    m_pgAdapter = {}
    bond(m_pgAdapter, 'getUnits').to((number, page, cb) -> [{"cbu": 1}])

    (require "../../../apps/units/routes")(app, m_pgAdapter)
    server = app.listen 7357

  describe '/units.json', ->
    body = null
    before (done) ->
      request 'http://localhost:7357/units.json', (err, response, _body) ->
        response.statusCode.should.eql(200)
        body = _body
        done()

    it 'should get json of the units', () ->

    it 'should be an JSON array of cord blood units', () ->
      units = JSON.parse(body)
      units.should.be.an.Array
      units[0].should.be({"cbu": 1})

    after ->
      server.close()
