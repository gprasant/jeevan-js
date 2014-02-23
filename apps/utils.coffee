{ isEqual } = require "underscore"

utils = () ->

  numberize: (obj) ->
    for k of obj
      obj[k] = parseInt( obj[k] )
    obj

  whereClause: (filter) ->
    if isEqual(filter, {})
      return "1=1"

module.exports = utils()