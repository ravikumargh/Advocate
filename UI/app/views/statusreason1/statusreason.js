'use strict';

angular.module('yeomanApp')
  .config(function ($routeProvider) {
      $routeProvider
        .when('/statusreason', {
            templateUrl: 'views/statusreason/statusreasons.html',
            controller: 'StatusreasonController'
        });
  });
