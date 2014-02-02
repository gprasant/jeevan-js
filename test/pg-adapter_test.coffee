adapter = require '../apps/pg-adapter'
assert = require 'assert'

describe 'pg-adapter', ->
  describe '#runQuery', ->
    it 'should get results of the query', (done) ->
      adapter.runQuery "Select 1 AS num", (err, units) ->
        units[0].num.should.eql(1)
        done()
