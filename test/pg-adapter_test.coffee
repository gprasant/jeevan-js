adapter = require '../apps/pg-adapter'
assert = require 'assert'

describe 'pg-adapter', ->
  describe '#runQuery', ->
    it 'should get results of the query', (done) ->
      adapter.runQuery "Select 1 AS num", (err, units) ->
        units[0].num.should.eql(1)
        done()

    it 'should get Cord Blood Units', (done) ->
      adapter.getUnits 15, 1, (err, units) ->
        assert.equal(err, null)
        units.should.be.an.Array
        units.length.should.be.greaterThan(0)
        for unit in units
          unit.should.have.property('hlaA1')
          unit.should.have.property('hlaA2')
          unit.should.have.property('hlaB1')
          unit.should.have.property('hlaB2')
          unit.should.have.property('hlaC1')
          unit.should.have.property('hlaC2')
          unit.should.have.property('drb1')
          unit.should.have.property('drb2')
          unit.should.have.property('dqb1')
          unit.should.have.property('dqb2')
        done()
