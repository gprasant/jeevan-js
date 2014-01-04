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


module.exports = CordBloodUnit