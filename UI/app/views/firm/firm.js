'use strict';

angular.module('yeomanApp')
  .config(function ($routeProvider) {
      $routeProvider
        .when('/firm', {
            templateUrl: 'views/firm/firms.html',
            controller: 'FirmController'
        });
  });
