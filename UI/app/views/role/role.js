'use strict';

angular.module('yeomanApp')
  .config(function ($routeProvider) {
      $routeProvider
        .when('/role', {
            templateUrl: 'views/role/roles.html',
            controller: 'RoleController'
        });
  });
