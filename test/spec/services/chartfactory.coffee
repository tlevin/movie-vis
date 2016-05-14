'use strict'

describe 'Service: chartFactory', ->

  # load the service's module
  beforeEach module 'moviesVisualizerApp'

  # instantiate service
  chartFactory = {}
  beforeEach inject (_chartFactory_) ->
    chartFactory = _chartFactory_

  it 'should do something', ->
    expect(!!chartFactory).toBe true
