'use strict';

angular.module('yeomanApp')
  .config(function ($routeProvider) {
      $routeProvider
        .when('/case', {
            templateUrl: 'views/case/cases.html',
            controller: 'CaseController'
        });
  });
