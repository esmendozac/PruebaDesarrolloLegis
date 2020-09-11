'use strict';

/**
 * @ngdoc function
 * @name legisEvoteFrontendApp.controller:MainCtrl
 * @description
 * # MainCtrl
 * Controller of the legisEvoteFrontendApp
 */
angular.module('legisEvoteFrontendApp')
  .controller('loginController', function ($scope, $location) {

    var vm = this;

    vm.init = function () {

      console.log("Iniciando controlador de login....");

    }



    /**
     *Abre la vista de registro
     *
     **/
    vm.registarVotante = function () {

      console.log("Cambio de ruta....");

      $location.url("/registro");

    }


    vm.init();

  });
