'use strict';
angular.module('yeomanApp').factory('FirmService', ['$http', '$q', 'localStorageService', 'ngAuthSettings', function ($http, $q, localStorageService, ngAuthSettings) {
        var serviceBase = ngAuthSettings.apiServiceBaseUri;

        var urlBase = serviceBase + 'api/firm/';
        var dataFactory = {};
        dataFactory.addNewFirm = function (firm) {
            return $http.post(urlBase, firm );
        };

         
        dataFactory.getFirms = function () {
            return $http.get(urlBase);
        };
         
        dataFactory.updateFirm = function (firm) {
            return $http.put(urlBase,  firm);
        };

        dataFactory.deleteFirm = function (firm_id) {
            return $http.delete(urlBase + firm_id + '/');
        };

        return dataFactory;
    }
]);
