jQuery ->
  $("table#samples").dynatable(
    dataset:
      ajax: true
      ajaxUrl: '/units.json/'
      ajaxOnLoad: true
      records: []
      perPage: 20
  )
