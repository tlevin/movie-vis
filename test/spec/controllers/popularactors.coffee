'use strict'

describe 'Controller: PopularactorsCtrl', ->

  # load the controller's module
  beforeEach module 'moviesVisualizerApp'

  PopularactorsCtrl = {}

  scope = {}

  # Initialize the controller and a mock scope
  beforeEach inject ($controller, $rootScope) ->
    scope = $rootScope.$new()
    PopularactorsCtrl = $controller 'PopularactorsCtrl', {
      # place here mocked dependencies
    }

  it 'should attach a list of awesomeThings to the scope', ->
    expect(PopularactorsCtrl.awesomeThings.length).toBe 3
