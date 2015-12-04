'use strict';

angular.module('yeomanApp')
  .config(function ($routeProvider) {
      $routeProvider
        .when('/clienttype', {
            templateUrl: 'views/clienttype/clienttypes.html',
            controller: 'ClientTypeController'
        });
  });
