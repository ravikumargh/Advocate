'use strict';

angular.module('yeomanApp')
  .controller('AdminMenuController', ['$scope', '$rootScope', function ($scope, $rootScope) {

      $scope.menus = [
		                      { active: false, text: 'Users', path: '.users' },
		                      //{ active: false, text: 'Clients', path: '.clients' },
                              //{ active: false, text: 'Client Types', path: '.clienttypes' },
		                      //{ active: false, text: 'Departments', path: '.departments' },
                              { active: false, text: 'Roles', path: '.roles' },
                              { active: false, text: 'Cases', path: '.cases' },
                              { active: false, text: 'My Cases', path: '.mycases' },
                              { active: false, text: 'Firms', path: '.firms' } 
      ];

      $scope.$on('handleBroadcast_setActiveResourcesTab', function (handler, view) {
          for (var i = 0; i < $scope.resourcesTabs.length; i++) {
              if ($scope.resourcesTabs[i].path == view) {
                  $scope.resourcesTabs[i].active = true;
              } else {
                  $scope.resourcesTabs[i].active = false;
              }
          }
      });

  }]);
