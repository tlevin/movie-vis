'use strict'

###*
 # @ngdoc function
 # @name moviesVisualizerApp.controller:TopgenresCtrl
 # @description
 # # TopgenresCtrl
 # Controller of the moviesVisualizerApp
###
angular.module 'moviesVisualizerApp'
  .controller 'TopgenresCtrl', (apiFactory, chartFactory) ->
    vm = @

    vm.init = ->  
      chartFactory.buildGenrePie().then (chart) ->
        vm.chartOptions = chart
    vm.init()
    return
