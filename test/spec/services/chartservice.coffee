'use strict'

describe 'Service: chartService', ->

  # load the service's module
  beforeEach module 'moviesVisualizerApp'

  # instantiate service
  chartService = {}
  beforeEach inject (_chartService_) ->
    chartService = _chartService_

  it 'should do something', ->
    expect(!!chartService).toBe true
