'use strict'

###*
 # @ngdoc function
 # @name moviesVisualizerApp.controller:PopularactorsCtrl
 # @description
 # # PopularactorsCtrl
 # Controller of the moviesVisualizerApp
###
angular.module 'moviesVisualizerApp'
  .controller 'PopularactorsCtrl', (chartFactory) ->
    vm = @
    vm.init = ->
      chartFactory.buildTreeMap().then (res) ->
        vm.chartOptions = res

    vm.init()
    return
