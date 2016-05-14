'use strict'

###*
 # @ngdoc overview
 # @name moviesVisualizerApp
 # @description
 # # moviesVisualizerApp
 #
 # Main module of the application.
###
angular
  .module 'moviesVisualizerApp', [
    'ngAnimate',
    'ngRoute',
    'ngSanitize',
    'ngTouch',
    'highcharts-ng'
  ]
  .config ($routeProvider) ->
    $routeProvider
      .when '/',
        templateUrl: 'views/main.html'
        controller: 'MainCtrl'
        controllerAs: 'main'
      .otherwise
        redirectTo: '/'

