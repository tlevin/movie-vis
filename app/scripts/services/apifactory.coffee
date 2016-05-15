'use strict'

###*
 # @ngdoc service
 # @name moviesVisualizerApp.apiFactory
 # @description
 # # apiFactory
 # Factory in the moviesVisualizerApp.
###
angular.module('moviesVisualizerApp').factory 'apiFactory', ($http) ->
  
  # In a normal app, the reqeusts would be from the serverside
  # to hide such things
  apiKey = 'd0856d87f087ed9f0e0b2268d5a226f2'
  {
    fetchGenres: ->
      $http(
        method: 'GET'
        url: 'http://api.themoviedb.org/3/genre/movie/list?api_key=' + apiKey
        ).then (response) ->
          response.data

    retrieveData: (base, querystring) ->
      querystring = querystring or ''
      url = base + apiKey + querystring
      $http(
        method: 'GET'
        url: url
        ).then (response) ->
          response.data

  }
