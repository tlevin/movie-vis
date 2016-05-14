'use strict'

angular.module 'moviesVisualizerApp'
  .service 'apiService', ->

    ## This key would normally be stored serverside
    ## for security reasons
    apiKey = 'd0856d87f087ed9f0e0b2268d5a226f2'
    @fetchGenres ->
      url = 'http://api.themoviedb.org/3/genre/movie/list?api_key='