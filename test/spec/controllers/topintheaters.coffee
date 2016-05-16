'use strict'

describe 'Controller: TopintheatersCtrl', ->

  # load the controller's module
  beforeEach module 'moviesVisualizerApp'

  TopintheatersCtrl = {}

  scope = {}

  # Initialize the controller and a mock scope
  beforeEach inject ($controller, $rootScope) ->
    scope = $rootScope.$new()
    TopintheatersCtrl = $controller 'TopintheatersCtrl', {
      # place here mocked dependencies
    }

  it 'should attach a list of awesomeThings to the scope', ->
    expect(TopintheatersCtrl.awesomeThings.length).toBe 3
