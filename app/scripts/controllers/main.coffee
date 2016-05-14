'use strict'

###*
 # @ngdoc function
 # @name moviesVisualizerApp.controller:MainCtrl
 # @description
 # # MainCtrl
 # Controller of the moviesVisualizerApp
###
angular.module 'moviesVisualizerApp'
  .controller 'MainCtrl', (apiService, chartService)->
    
    @init () ->
      apiService.fetchGenres().then((res)-> 
        @genres = res.genres
      )




    return
