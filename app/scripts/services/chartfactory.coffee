'use strict'

###*
 # @ngdoc service
 # @name moviesVisualizerApp.chartFactory
 # @description
 # # chartFactory
 # Factory in the moviesVisualizerApp.
###
angular.module 'moviesVisualizerApp'
  .factory 'chartFactory', (apiFactory) ->
    

    buildChart: (queryString, chartTitle) ->

      # Fetches search data based on query
      apiFactory.retrieveData(queryString).then (res) ->
        popular = []
        ratings = []
        titles = []
        result = res.results
        # Builds arrays for use in chart
        result.forEach (movie) ->
          popular.push(movie.popularity)
          ratings.push(movie.vote_average)
          titles.push(movie.original_title)
          return
        {
          chart: 
            type: 'column'
          title:
            text: chartTitle
          xAxis:
            categories: titles
            title:
              text: null
          yAxis:
            min: 0
            title:
              text: null
          plotOptions:
            bar:
              dataLabels:
                enabled: true
          legend:
            layout: 'vertical'
            align: 'right'
            verticalAlign: 'top'
            x: -40
            y: 80
            floating: true
            borderWidth: 1
            backgroundColor: ((Highcharts.theme && Highcharts.theme.legendBackgroundColor) or '#FFFFFF')
            shadow: true
          credits:
            enabled: false
          series: [{
            name: 'Popularity'
            data: popular
            type: 'column'
          },{
            name: 'Ratings'
            data: ratings
            type: 'column'
          }]
        }