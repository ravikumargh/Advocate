'use strict';

/**
 * @ngdoc function
 * @name yeomanApp.controller:AboutCtrl
 * @description
 * # AboutCtrl
 * Controller of the yeomanApp
 */
angular.module('yeomanApp')
  .controller('StatusreasonController', ['$scope', '$uibModal', '$log', function ($scope, $uibModal, $log) {
  	$scope.awesomeThings = [
      'HTML5 Boilerplate',
      'AngularJS',
      'Karma'
  	];


  	$scope.deleteClientModel = function (client) {
  		$scope.selectedClient = client;
  		var modalInstance = $uibModal.open({
  			animation: $scope.animationsEnabled,
  			templateUrl: 'DeleteConfirmationModalContent.html',
  			controller: 'DeleteConfirmationModalInstanceControl',
  			size: 'sm',
  			animation: 'true',
  			resolve: {
  				parentScope: function () {
  					return $scope;
  				}
  			}
  		});

  		modalInstance.result.then(function (selectedClient) {
  			//$scope.selected = selectedItem;
  			$scope.deleteClient(selectedClient);
  		}, function () {
  			$log.info('Modal dismissed at: ' + new Date());
  		});
  	};
  }]);
