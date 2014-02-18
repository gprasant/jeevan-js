jQuery ->
  $("table#samples").dynatable(
    dataset:
      ajax: true
      ajaxUrl: '/units.json/1'
      ajaxOnLoad: true
      records: []
  )
