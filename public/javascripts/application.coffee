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
    hlaB1 = $("#search-hlaB1").val()
    hlaB2 = $("#search-hlaB2").val()
    drb1  = $("#search-drb1").val()
    drb2  = $("#search-drb2").val()
    cbuTable.queries.add "hlaA1", hlaA1 if hlaA1
    cbuTable.queries.add "hlaA2", hlaA2 if hlaA2
    cbuTable.queries.add "hlaB1", hlaB1 if hlaB1
    cbuTable.queries.add "hlaB2", hlaB2 if hlaB2
    cbuTable.queries.add "drb1", drb1 if drb1
    cbuTable.queries.add "drb2", drb2 if drb2

    cbuTable.process()