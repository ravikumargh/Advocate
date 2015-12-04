'use strict';

angular.module('yeomanApp')
  .config(function ($routeProvider) {
      $routeProvider
        .when('/status', {
            templateUrl: 'views/status/statuses.html',
            controller: 'StatusController'
        });
  });
