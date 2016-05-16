'use strict'

###*
 # @ngdoc function
 # @name moviesVisualizerApp.controller:TopupcomingCtrl
 # @description
 # # TopupcomingCtrl
 # Controller of the moviesVisualizerApp
###
angular.module 'moviesVisualizerApp'
  .controller 'TopupcomingCtrl', (apiFactory, chartFactory) ->
    vm = @

    vm.init = ->
      apiFactory.retrieveData('http://api.themoviedb.org/3/movie/upcoming?api_key=').then (data) ->
        vm.chartOptions = chartFactory.buildChart(data,'Top Movies Coming Soon to Theaters')
           

    vm.init()
    return
