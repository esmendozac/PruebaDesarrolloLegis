'use strict';

/**
 * @ngdoc overview
 * @name legisEvoteFrontendApp
 * @description
 * # legisEvoteFrontendApp
 *
 * Main module of the application.
 */
angular
  .module('legisEvoteFrontendApp', [
    'ngAnimate',
    'ngCookies',
    'ngResource',
    'ngRoute',
    'ngSanitize',
    'ngTouch'
  ])
  .config(function ($routeProvider, $locationProvider) {

    $locationProvider.hashPrefix("");

    $routeProvider
      .when('/', {
        templateUrl: 'views/login.html',
        controller: 'loginController',
        controllerAs: 'login'
      })
      .when('/registro', {
        templateUrl: 'views/registro.html',
        controller: 'registroController',
        controllerAs: 'registro'
      })
      .otherwise({
        redirectTo: '/'
      });
  });
