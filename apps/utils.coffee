{ isEqual } = require "underscore"

utils = () ->

  numberize: (obj) ->
    for k of obj
      obj[k] = parseInt( obj[k] )
    obj

  whereClause: (filter) ->
    conditions = ["1=1"]
    for k of filter
      conditions.push "#{k}=#{filter[k]}"
    allConditions = conditions.join( " AND " )
    return "WHERE #{allConditions}"

module.exports = utils()