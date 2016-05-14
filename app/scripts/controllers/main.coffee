'use strict'

###*
 # @ngdoc function
 # @name moviesVisualizerApp.controller:MainCtrl
 # @description
 # # MainCtrl
 # Controller of the moviesVisualizerApp
###
angular.module 'moviesVisualizerApp'
  .controller 'MainCtrl', (apiFactory, chartFactory) ->
    vm = @
    vm.init = ->
      apiFactory.fetchGenres().then (res) -> 
        vm.genres = res.genres

      # Default view is with all years, all genres, sorted by revenue
      chartFactory.buildChart('&sort_by=revenue.desc', 'Highest Revenue Movies').then (chart) ->
        vm.chartOptions = chart

    vm.resetChoices = ->
      vm.selectedYear = null
      vm.selectedGenre = null
      vm.sortRating = false
      vm.sortPopular = false
      vm.sortRevenue = false
    
    vm.buildChart = ->
      queryString = '' 
      if vm.selectedGenre not null
        queryString += '&with_genres=' + vm.selectedGenre.id
      if vm.selectedYear not null
        queryString += '&primary_release_year=' + vm.selectedYear

    vm.years = [2016..1920]

    vm.init()
    return
