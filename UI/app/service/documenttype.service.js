'use strict';
angular.module('yeomanApp').factory('DocumentTypeService', ['$http', '$q', 'localStorageService', 'ngAuthSettings', function ($http, $q, localStorageService, ngAuthSettings) {
        var serviceBase = ngAuthSettings.apiServiceBaseUri;

        var urlBase = serviceBase + 'api/documenttype/';
        var dataFactory = {};
        dataFactory.addNewDocumentType = function (documentType) {
            return $http.post(urlBase, documentType );
        };

         
        dataFactory.getDocumentTypes = function () {
            return $http.get(urlBase);
        };
         
        dataFactory.updateDocumentType = function (documentType) {
            return $http.put(urlBase,  documentType);
        };

        dataFactory.deleteDocumentType = function (documentType_id) {
            return $http.delete(urlBase + documentType_id + '/');
        };

        return dataFactory;
    }
]);
