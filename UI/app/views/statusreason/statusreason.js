'use strict';

angular.module('yeomanApp')
  .config(function ($routeProvider) {
      $routeProvider
        .when('/statusreasons', {
            templateUrl: 'views/statusreasons/statusreasons.html',
            controller: 'StatusreasonController'
        });
  });
