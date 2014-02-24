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
    # clear the queries array
    cbuTable.queries.remove "hla_a1"
    cbuTable.queries.remove "hla_a2"
    cbuTable.queries.remove "hla_b1"
    cbuTable.queries.remove "hla_b2"
    cbuTable.queries.remove "hla_b2"
    cbuTable.queries.remove "drb_1"
    cbuTable.queries.remove "drb_2"

    # add the queries
    cbuTable.queries.add "hla_a1", hlaA1 if hlaA1
    cbuTable.queries.add "hla_a2", hlaA2 if hlaA2
    cbuTable.queries.add "hla_b1", hlaB1 if hlaB1
    cbuTable.queries.add "hla_b2", hlaB2 if hlaB2
    cbuTable.queries.add "drb_1", drb1 if drb1
    cbuTable.queries.add "drb_2", drb2 if drb2

    cbuTable.process()