'use strict';
angular.module('yeomanApp').factory('CaseService', ['$http', '$q', 'localStorageService', 'ngAuthSettings', function ($http, $q, localStorageService, ngAuthSettings) {
        var serviceBase = ngAuthSettings.apiServiceBaseUri;

        var urlBase = serviceBase + 'api/case/';
        var dataFactory = {};
        dataFactory.addNewCase = function (_case) {
            return $http.post(urlBase, _case );
        };

         
        dataFactory.getCases = function () {
            return $http.get(urlBase);
        };
         
        dataFactory.updateCase = function (_case) {
            return $http.put(urlBase,  _case);
        };

        dataFactory.deleteCase = function (case_id) {
            return $http.delete(urlBase + case_id + '/');
        };

        return dataFactory;
    }
]);
