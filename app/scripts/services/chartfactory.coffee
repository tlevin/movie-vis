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
    vm = @
    {
      buildGenrePie: ->
        apiFactory.fetchGenres().then (res) ->
          baseUrl = 'http://api.themoviedb.org/3/discover/movie?api_key='

        # Build hash of genres with id as key, name as value
          vm.genres = {}
          i = 0
          while i < res.genres.length
            vm.genres[res.genres[i].id] = res.genres[i].name
            i++
          apiFactory.retrieveData(baseUrl, '&sort_by=revenue.desc').then (res) ->
            # Create hash of genre count in top movies
            genresHash = {}
            result = res.results

            result.forEach (item) ->
              item.genre_ids.forEach (genreid) ->
                genresHash[vm.genres[genreid]] = genresHash[vm.genres[genreid]] + 1 or 1

            names = []
            values = []
            for genres of genresHash
              names.push genres
              values.push genresHash[genres]
      buildChart: (queryString, chartTitle) ->
        baseUrl = 'http://api.themoviedb.org/3/discover/movie?api_key='
        # Fetches search data based on query
        apiFactory.retrieveData(baseUrl, queryString).then (res) ->
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
          # Returns chart config file
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

      buildHeatMap: ->
        baseUrl = 'http://api.themoviedb.org/3/person/popular?api_key='
        apiFactory.retrieveData(baseUrl).then (res) ->
          people = res.results
          data = []
          personId = 0
          j = 0
          # Builds the parent Node of the treemap
          while j < people.length
            person = people[j]
            personNode = 
              id: 'id_' + personId
              name: person.name
              value: person.popularity
              color: Highcharts.getOptions().colors[j%10]
            i = 0
            # Adds the children nodes
            while i < person.known_for.length
              movieNode = 
                id: personId + '_' + i
                name: person.known_for[i].title
                value: person.known_for[i].popularity
                parent: personNode.id
              data.push movieNode
              i++

            personId++
            data.push personNode
            j++

          {
            series: [
              type: 'treemap'
              layoutAlgorithm: 'squarified'
              allowDrillToNode: true
              animationLimit: 1000
              dataLabels:
                  enabled: false
              levelIsConstant: false
              levels: [
                  level: 1
                  dataLabels:
                    enabled: true
                  borderWidth: 3
              ]
              data: data
            ]
            subtitle:
              text: 'Click on an actor to see the movies they are known for'
            title:
              text: 'Most Popular Actors'
          }

    }
