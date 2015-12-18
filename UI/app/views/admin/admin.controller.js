'use strict';

/**
 * @ngdoc function
 * @name yeomanApp.controller:AboutCtrl
 * @description
 * # AboutCtrl
 * Controller of the yeomanApp
 */
angular.module('yeomanApp')
  .controller('AdminController', ['$scope', '$rootScope', '$uibModal', '$log', 'DocumentTypeService', function ($scope, $rootScope, $uibModal, $log, DocumentTypeService) {

      $scope.init = function () {
          DocumentTypeService.getDocumentTypes()
             .then(function (response) {
                 window.documentTypes = response.data;
             },
             function (err) {

             });
      };


  }]);

