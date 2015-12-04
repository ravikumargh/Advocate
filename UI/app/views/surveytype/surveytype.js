'use strict';

angular.module('yeomanApp')
  .config(function ($routeProvider) {
      $routeProvider
        .when('/surveytype', {
            templateUrl: 'views/surveytype/surveytypes.html',
            controller: 'SurveyTypeController'
        });
  });
