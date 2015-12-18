'use strict';
angular.module('yeomanApp').factory('DocumentService', ['$http', '$q', 'localStorageService', 'ngAuthSettings', 'Upload', function ($http, $q, localStorageService, ngAuthSettings, Upload) {
        var serviceBase = ngAuthSettings.apiServiceBaseUri;

        var urlBase = serviceBase + 'api/document/';
        var dataFactory = {};
        dataFactory.addNewDocument = function (data) {
            return $http.post(urlBase, data);
        };

        dataFactory.getDocuments = function () {
            return $http.get(urlBase);
        };
        dataFactory.getDocumentsById = function (id) {
            return $http.get(urlBase + 'get/'+id);
        };
        dataFactory.getDocumentsByUserId = function (id) {
            return $http.get(urlBase + 'GetUserById/' + id);
        };
        dataFactory.updateDocument = function (document) {
            return $http.put(urlBase,  document);
        };

        dataFactory.deleteDocument = function (document_id) {
            return $http.delete(urlBase + document_id + '/');
        };

        return dataFactory;
    }
]);
