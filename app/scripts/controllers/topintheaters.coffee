'use strict'

###*
 # @ngdoc function
 # @name moviesVisualizerApp.controller:TopintheatersCtrl
 # @description
 # # TopintheatersCtrl
 # Controller of the moviesVisualizerApp
###
angular.module 'moviesVisualizerApp'
  .controller 'TopintheatersCtrl', (apiFactory, chartFactory) ->
    vm = @

    vm.init = ->
      apiFactory.retrieveData('http://api.themoviedb.org/3/movie/now_playing?api_key=').then (data) ->
        vm.chartOptions = chartFactory.buildChart(data,'Top Movies in Theaters')
           

    vm.init()
    return
