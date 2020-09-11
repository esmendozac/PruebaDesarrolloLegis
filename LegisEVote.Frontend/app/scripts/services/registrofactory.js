'use strict';

/**
 * @ngdoc service
 * @name legisEvoteFrontendApp.registroFactory
 * @description
 * # registroFactory
 * Factory in the legisEvoteFrontendApp.
 */
angular.module('legisEvoteFrontendApp')
  .factory('registroFactory', function ($http) {

    var urlApi = "http://localhost:50136/";

    return {
      postVotante: function (votante) {
        return $http.post(urlApi + "api/Persona/Votante", mensaje);
      }
    };



  });
