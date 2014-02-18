pgAdapter = require "../pg-adapter"

class CordBloodUnit
  constructor: ({@hlaA1, @hlaA2, @hlaB1, @hlaB2, @drb1, @drb2, @hlaC1, @hlaC2, @dqb1, @dqb2}) ->

  getMatchCount: (other) ->
    matchCount = 0

    if other.hlaA1 is @hlaA1
      matchCount++
    if other.hlaA2 is @hlaA2
      matchCount++
    if other.hlaB1 is @hlaB1
      matchCount++
    if other.hlaB2 is @hlaB2
      matchCount++
    if other.drb1 is @drb1
      matchCount++
    if other.drb2 is @drb2
      matchCount++

    matchCount

  # Class Methods
  # use dynatable ajax : http://stackoverflow.com/questions/21297192/load-remote-json-from-dynatable
  @getSamples: (page, callback) ->
    pgAdapter = require "../pg-adapter" # require this here again because otherwise, pgAdapter is set to {}
    pgAdapter.getUnits page, (err, units) ->
      if err
        callback err
        return
      else
        callback null, units


module.exports = CordBloodUnit