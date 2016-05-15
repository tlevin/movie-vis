'use strict'

describe 'Controller: TopgenresCtrl', ->

  # load the controller's module
  beforeEach module 'moviesVisualizerApp'

  TopgenresCtrl = {}

  scope = {}

  # Initialize the controller and a mock scope
  beforeEach inject ($controller, $rootScope) ->
    scope = $rootScope.$new()
    TopgenresCtrl = $controller 'TopgenresCtrl', {
      # place here mocked dependencies
    }

  it 'should attach a list of awesomeThings to the scope', ->
    expect(TopgenresCtrl.awesomeThings.length).toBe 3
