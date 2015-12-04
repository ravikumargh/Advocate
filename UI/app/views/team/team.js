'use strict';

angular.module('yeomanApp')
  .config(function ($routeProvider) {
      $routeProvider
        .when('/team', {
            templateUrl: 'views/team/teams.html',
            controller: 'TeamController'
        });
  });
