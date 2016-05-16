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
    vm.sortBy = 'revenue'
    vm.init = ->
      apiFactory.fetchGenres().then (res) -> 
        vm.genres = res.genres

      # Default view is with all years, all genres, sorted by revenue
      vm.buildChart()

    vm.resetChoices = ->
      vm.selectedYear = null
      vm.selectedGenre = null
      vm.sortBy = 'revenue'
      vm.asc = false
    
    vm.buildChart = ->
      queryString = ''
      quality = if vm.asc then 'Worst' else 'Best' 
      title = quality + ' Movies'
      order = if vm.asc then '.asc' else '.desc'

      # Build Querystring and conditional title
      if vm.selectedGenre
        queryString += '&with_genres=' + vm.selectedGenre.id
        title = quality + ' ' + vm.selectedGenre.name + ' Movies'
      if vm.selectedYear
        title += ' in ' + vm.selectedYear
        queryString += '&primary_release_year=' + vm.selectedYear
      queryString += '&sort_by='+ vm.sortBy + order
      if vm.sortBy is 'revenue' or vm.sortBy is 'popularity'
        title += ' by ' + vm.sortBy[0].toUpperCase() + vm.sortBy.slice(1)
      if vm.sortBy is 'vote_average'
        title += ' by User Rating'
        # Eliminates high vote averages that do not have a large count
        queryString += '&vote_count.gte=100'

      # Fetches data and builds chart config
      apiFactory.retrieveData('http://api.themoviedb.org/3/discover/movie?api_key=', queryString).then (data) ->
        vm.chartOptions = chartFactory.buildChart(data, title)

    vm.years = [2016..1920]

    vm.init()
    return
