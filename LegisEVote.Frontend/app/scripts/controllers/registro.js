'use strict';

/**
 * @ngdoc function
 * @name legisEvoteFrontendApp.controller:MainCtrl
 * @description
 * # MainCtrl
 * Controller of the legisEvoteFrontendApp
 */
angular.module('legisEvoteFrontendApp')
  .controller('registroController', function ($location, $window, $scope, registroFactory) {

    var vm = this;

    //Modelo de un votante
    vm.votante = {
      IdPersona: 0,
      Nombres: null,
      Apellidos: null,
      FechaNacimiento: new Date(),
      Email: null,
      TipoIdentificacion: null,
      NumeroIdentificacion: null,
      Sexo: null,
      Foto: null,
      Contrasena: null,
      ConfirmarContraseña: null
    };

    vm.init = function () {

      console.log("Iniciando controlador de registro....");

    }


    /**
     * Almacena el registro de un votante
     * */
    vm.guadarVotante = function () {

      console.log("Votante: ", vm.votante);

      //registroFactory.postVotante().success(function (data) {


      //}).error(function (error) {


      //});

    }


    /**
     * Retorna a la vista 
     * */
    vm.volver = function () {

      $location.url("/");

    }

    vm.init();

  });
