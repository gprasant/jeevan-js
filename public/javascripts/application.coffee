jQuery ->
  cbuTable = $("table#samples").dynatable(
    features:
      search: false
    dataset:
      ajax: true
      ajaxUrl: '/units.json/'
      ajaxOnLoad: true
      records: []
      perPage: 20
  ).data('dynatable')

  $('#search').click ()->
    hlaA1 = $("#search-hlaA1").val()
    hlaA2 = $("#search-hlaA2").val()
    cbuTable.queries.add "hlaA1", hlaA1
    cbuTable.queries.add "hlaA2", hlaA2

    cbuTable.process()