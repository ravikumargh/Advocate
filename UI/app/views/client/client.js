'use strict';

angular.module('yeomanApp')
  .config(function ($routeProvider) {
      $routeProvider
        .when('/client', {
            templateUrl: 'views/client/clients.html',
            controller: 'ClientController'
        });
  });
