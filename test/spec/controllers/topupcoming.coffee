'use strict'

describe 'Controller: TopupcomingCtrl', ->

  # load the controller's module
  beforeEach module 'moviesVisualizerApp'

  TopupcomingCtrl = {}

  scope = {}

  # Initialize the controller and a mock scope
  beforeEach inject ($controller, $rootScope) ->
    scope = $rootScope.$new()
    TopupcomingCtrl = $controller 'TopupcomingCtrl', {
      # place here mocked dependencies
    }

  it 'should attach a list of awesomeThings to the scope', ->
    expect(TopupcomingCtrl.awesomeThings.length).toBe 3
