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
    # vm.chartOptions = null
    vm.init = ->
      chartFactory.buildHeatMap().then (res) ->
        console.log res
        vm.chartOptions = res

    vm.init()
    return
