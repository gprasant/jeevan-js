{equal} = require "assert"

CordBloodUnit = require '../../apps/models/CordBloodUnit'

describe 'CordBloodUnit', ->
  cbu = null
  before () ->
    cbu = new CordBloodUnit
      hlaA1: 1
      hlaB1: 2
      drb1:  3
  it "should set attrs", ->
    equal cbu['hlaA1'], 1
    equal cbu['hlaB1'], 2
    equal cbu['drb1'], 3