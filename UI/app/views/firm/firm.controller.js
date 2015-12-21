'use strict';

/**
 * @ngdoc function
 * @name yeomanApp.controller:AboutCtrl
 * @description
 * # AboutCtrl
 * Controller of the yeomanApp
 */
angular.module('yeomanApp')
  .controller('FirmController', ['$scope', 'FirmService', '$uibModal', '$log', function ($scope, FirmService, $uibModal, $log) {

      $scope.newfirm = {
          'Name': '' 
      }

    
      $scope.init = function () {

          $scope.firms = null;

          FirmService.getFirms()
              .then(function (response) {
                  $scope.firms = response.data;
              },
              function (err) {

              });
      };

      $scope.deleteFirm = function (firm) {
          FirmService.deleteFirm(firm.Id).then(function (response) {
              //_.remove($scope.firms, function (firm) {
              //    return firm.Id;
              //});
              $scope.init();
          },
            function (err) {
                $scope.error = err;
            });
      }
      $scope.createNewFirm = function () {
          $scope.error = undefined;
          //if (!$scope.newfirm.name) {
          //    $scope.error = 'Please enter valid firm name.';
          //    return;
          //}
          //$scope.newfirm.Name = "Firm 1";
          $scope.addNew($scope.newfirm);
      };

      $scope.addNew = function (newfirm) {
          FirmService.addNewFirm(newfirm).then(function (response) {
              $scope.init();
          },
          function (err) {

          });
      }

      $scope.update = function (firm) {
          FirmService.updateFirm(firm).then(function (response) {
              $scope.init();
          },
          function (err) {

          });
      }
      
      $scope.editFirmModel = function (firm) {
          $scope.selectedFirm = angular.copy(firm);

          var modalInstance = $uibModal.open({
              animation: $scope.animationsEnabled,
              templateUrl: 'FirmModalContent.html',
              controller: 'FirmModalInstanceCtrl',
              size: 'sm',
              animation: true,
              resolve: {
                  parentScope: function () {
                      return $scope;
                  }
              }
          });

          modalInstance.result.then(function (firm) {
              $scope.update(firm);
          }, function () {
              $log.info('Modal dismissed at: ' + new Date());
          });
      }
      $scope.openNewFirmModel = function () {
          $scope.selectedFirm= $scope.newfirm;
          var modalInstance = $uibModal.open({
              animation: $scope.animationsEnabled,
              templateUrl: 'FirmModalContent.html',
              controller: 'FirmModalInstanceCtrl',
              size: 'sm',
              animation: true,
              resolve: {
                  parentScope: function () {
                      return $scope;
                  }
              }
          });

          modalInstance.result.then(function (newFirm) {
              $scope.addNew(newFirm);
          }, function () {
              $log.info('Modal dismissed at: ' + new Date());
          });
      };
      $scope.deleteFirmModel = function (firm) {
          $scope.selectedFirm = firm;
          var modalInstance = $uibModal.open({
              animation: $scope.animationsEnabled,
              templateUrl: 'FirmDeleteConfirmationModalContent.html',
              controller: 'FirmDeleteConfirmationModalInstanceControl',
              size: 'sm', 
              animation: true,
              resolve: {
                  parentScope: function () {
                      return $scope;
                  }
              }
          });

          modalInstance.result.then(function (selectedFirm) {
              $scope.deleteFirm(selectedFirm);
          }, function () {
              $log.info('Modal dismissed at: ' + new Date());
          });
      };
  }]);


angular.module('yeomanApp').controller('FirmModalInstanceCtrl', function ($scope, $uibModalInstance, parentScope) {

    $scope.selectedFirm = parentScope.selectedFirm;
    
    $scope.ok = function () {
        $uibModalInstance.close($scope.selectedFirm);
    };

    $scope.cancel = function () {
        $uibModalInstance.dismiss('cancel');
    };
});

angular.module('yeomanApp').controller('FirmDeleteConfirmationModalInstanceControl', function ($scope, $uibModalInstance, parentScope) {

    $scope.selectedFirm = parentScope.selectedFirm;


    $scope.ok = function () {
        $uibModalInstance.close($scope.selectedFirm);
    };

    $scope.cancel = function () {
        $uibModalInstance.dismiss('cancel');
    };
});