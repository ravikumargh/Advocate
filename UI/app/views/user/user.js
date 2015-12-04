'use strict';

angular.module('yeomanApp')
  .config(function ($routeProvider) {
      $routeProvider
        .when('/user', {
            templateUrl: 'views/user/users.html',
            controller: 'UserController'
        });
  });
