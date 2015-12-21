'use strict';
angular.module('yeomanApp').factory('MyCaseService', ['$http', '$q', 'localStorageService', 'ngAuthSettings', function ($http, $q, localStorageService, ngAuthSettings) {
        var serviceBase = ngAuthSettings.apiServiceBaseUri;

        var urlBase = serviceBase + 'api/mycase/';
        var dataFactory = {};
        dataFactory.addNewMyCase = function (mycase) {
            return $http.post(urlBase, mycase );
        };

         
        dataFactory.getMyCases = function () {
            return $http.get(urlBase);
        };
         
        dataFactory.updateMyCase = function (mycase) {
            return $http.put(urlBase,  mycase);
        };

        dataFactory.deleteMyCase = function (mycase_id) {
            return $http.delete(urlBase + mycase_id + '/');
        };

        return dataFactory;
    }
]);
