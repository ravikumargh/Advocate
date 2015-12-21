'use strict';

angular.module('yeomanApp')
  .config(function ($stateProvider) {
      $stateProvider
        .state('admin', {
            url: '/admin',
            templateUrl: 'views/admin/admin.html',
            controller: 'AdminController'
        })
        .state('admin.users', {
            url: '/users',
            templateUrl: 'views/user/users.html',
            controller: 'UserController',
            data: {
                requireLogin: true
            }
        })
        .state('admin.clients', {
            url: '/clients',
            templateUrl: 'views/client/clients.html',
            controller: 'ClientController',
            data: {
                requireLogin: true
            }
        })
        .state('admin.roles', {
            url: '/roles',
            templateUrl: 'views/role/roles.html',
            controller: 'RoleController',
            data: {
                requireLogin: true
            }
        })
        .state('admin.firms', {
            url: '/firms',
            templateUrl: 'views/firm/firms.html',
            controller: 'FirmController',
            data: {
                requireLogin: true
            }
        })
           .state('admin.cases', {
               url: '/cases',
               templateUrl: 'views/case/cases.html',
               controller: 'CaseController',
               data: {
                   requireLogin: true
               }
           })
          .state('admin.mycases', {
              url: '/mycases',
              templateUrl: 'views/mycase/mycases.html',
              controller: 'MyCaseController',
              data: {
                  requireLogin: true
              }
          })
          .state('admin.statuses', {
              url: '/statuses',
              templateUrl: 'views/status/statuses.html',
              controller: 'StatusController',
              data: {
                  requireLogin: true
              }
          })
          .state('admin.surveytypes', {
              url: '/surveytypes',
              templateUrl: 'views/surveytype/surveytypes.html',
              controller: 'SurveyTypeController',
              data: {
                  requireLogin: true
              }
          })
          .state('admin.clienttypes', {
              url: '/clienttypes',
              templateUrl: 'views/clienttype/clienttypes.html',
              controller: 'ClientTypeController',
              data: {
                  requireLogin: true
              }
          })
            .state('admin.statusreasons', {
                url: '/statusreasons',
                templateUrl: 'views/statusreason/statusreasons.html',
                controller: 'StatusreasonController',
                data: {
                    requireLogin: true
                }
            })
      .state('admin.departments', {
          url: '/departments',
          templateUrl: 'views/department/departments.html',
          controller: 'DepartmentController',
          data: {
              requireLogin: true
          }
      });
  });
