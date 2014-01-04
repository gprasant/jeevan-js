require "should"

CordBloodUnit = require '../../apps/models/CordBloodUnit'

describe 'CordBloodUnit', ->
  cbu = null
  before () ->
    cbu = new CordBloodUnit
      hlaA1: 1
      hlaB1: 2
      drb1:  3
  it "should set attrs", ->
    cbu['hlaA1'].should.eql(1)
    cbu['hlaB1'].should.eql(2)
    cbu['drb1'].should.eql(3)

  describe '#getMatchCount', ->
    before (done) ->
      cbu = new CordBloodUnit
        hlaA1: 1
        hlaA2: 2
        hlaB1: 3
        hlaB2: 4
        drb1: 5
        drb2: 6
      done()

    it 'should get the match count of alleles', ->
      _1match = new CordBloodUnit
        hlaA1: 1
        hlaA2: 0
        hlaB1: 0
        hlaB2: 0
        drb1: 0
        drb2: 0

      cbu.getMatchCount(_1match).should.eql(1)

      _4matches = new CordBloodUnit
        hlaA1: 1
        hlaA2: 2
        hlaB1: 3
        hlaB2: 4
        drb1: 0
        drb2: 0

      cbu.getMatchCount(_4matches).should.eql(4)
