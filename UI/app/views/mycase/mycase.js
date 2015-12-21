'use strict';

angular.module('yeomanApp')
  .config(function ($routeProvider) {
      $routeProvider
        .when('/mycase', {
            templateUrl: 'views/mycase/mycases.html',
            controller: 'MyCaseController'
        });
  });
