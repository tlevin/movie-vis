'use strict'

describe 'Service: apiFactory', ->

  # load the service's module
  beforeEach module 'moviesVisualizerApp'

  # instantiate service
  apiFactory = {}
  beforeEach inject (_apiFactory_) ->
    apiFactory = _apiFactory_

  it 'should do something', ->
    expect(!!apiFactory).toBe true
