'use strict';

/**
 * @ngdoc function
 * @name yeomanApp.controller:AboutCtrl
 * @description
 * # AboutCtrl
 * Controller of the yeomanApp
 */
angular.module('yeomanApp')
  .controller('MyCaseController', ['$scope', 'MyCaseService', '$uibModal', '$log', 'UserService', function ($scope, MyCaseService, $uibModal, $log, UserService) {

      $scope.newmycase = {
          'Name': '' 
      }

    
      $scope.init = function () {

          $scope.mycases = null;

          MyCaseService.getMyCases()
              .then(function (response) {
                  $scope.mycases = response.data;
              },
              function (err) {

              });

          $scope.clients = null;

          UserService.getUsers()
              .then(function (response) {
                  $scope.clients = response.data;
              },
              function (err) {

              });

      };

      $scope.deleteMyCase = function (mycase) {
          MyCaseService.deleteMyCase(mycase.Id).then(function (response) {
              //_.remove($scope.mycases, function (mycase) {
              //    return mycase.Id;
              //});
              $scope.init();
          },
            function (err) {
                $scope.error = err;
            });
      }
      $scope.createNewMyCase = function () {
          $scope.error = undefined;
          //if (!$scope.newmycase.name) {
          //    $scope.error = 'Please enter valid mycase name.';
          //    return;
          //}
          //$scope.newmycase.Name = "MyCase 1";
          $scope.addNew($scope.newmycase);
      };

      $scope.addNew = function (newmycase) {
          MyCaseService.addNewMyCase(newmycase).then(function (response) {
              $scope.init();
          },
          function (err) {

          });
      }

      $scope.update = function (mycase) {
          MyCaseService.updateMyCase(mycase).then(function (response) {
              $scope.init();
          },
          function (err) {

          });
      }
      
      $scope.editMyCaseModel = function (mycase) {
          $scope.selectedMyCase = angular.copy(mycase);

          var modalInstance = $uibModal.open({
              animation: $scope.animationsEnabled,
              templateUrl: 'MyCaseModalContent.html',
              controller: 'MyCaseModalInstanceCtrl',
              size: 'sm',
              animation: true,
              resolve: {
                  parentScope: function () {
                      return $scope;
                  }
              }
          });

          modalInstance.result.then(function (mycase) {
              $scope.update(mycase);
          }, function () {
              $log.info('Modal dismissed at: ' + new Date());
          });
      }
      
      $scope.openNewMyCaseModel = function () {
          $scope.selectedMyCase= $scope.newmycase;
          var modalInstance = $uibModal.open({
              animation: $scope.animationsEnabled,
              templateUrl: 'MyCaseModalContent.html',
              controller: 'MyCaseModalInstanceCtrl',
              size: 'sm',
              animation: true,
              resolve: {
                  parentScope: function () {
                      return $scope;
                  }
              }
          });

          modalInstance.result.then(function (newMyCase) {
              $scope.addNew(newMyCase);
          }, function () {
              $log.info('Modal dismissed at: ' + new Date());
          });
      };
      $scope.deleteMyCaseModel = function (mycase) {
          $scope.selectedMyCase = mycase;
          var modalInstance = $uibModal.open({
              animation: $scope.animationsEnabled,
              templateUrl: 'MyCaseDeleteConfirmationModalContent.html',
              controller: 'MyCaseDeleteConfirmationModalInstanceControl',
              size: 'sm', 
              animation: true,
              resolve: {
                  parentScope: function () {
                      return $scope;
                  }
              }
          });

          modalInstance.result.then(function (selectedMyCase) {
              $scope.deleteMyCase(selectedMyCase);
          }, function () {
              $log.info('Modal dismissed at: ' + new Date());
          });
      };
      
      $scope.addAdvocatesToMyCaseModel = function (mycase) {
              $scope.selectedMyCase = angular.copy(mycase);

              var modalInstance = $uibModal.open({
                  animation: $scope.animationsEnabled,
                  templateUrl: 'AdvocatesToMyCaseModalContent.html',
                  controller: 'AdvocatesToMyCaseModalInstanceCtrl',
                  size: 'sm',
                  animation: true,
                  resolve: {
                      parentScope: function () {
                          return $scope;
                      }
                  }
              });

              modalInstance.result.then(function (mycase) {
                  $scope.update(mycase);
              }, function () {
                  $log.info('Modal dismissed at: ' + new Date());
              });
          }
      $scope.getClientDetails = function (rowObj) {
          return _.find($scope.clients, function(client) {
              return client.Id ===rowObj.row.ClientId;
          });
      };
      $scope.getAdvocateDetails = function (rowObj) {
          return _.find($scope.clients, function(advocate) {
              return advocate.Id ===rowObj.row.AdvocateId;
          });
      };
  }]);


angular.module('yeomanApp').controller('MyCaseModalInstanceCtrl', function ($scope, $uibModalInstance, parentScope) {

    $scope.selectedMyCase = parentScope.selectedMyCase;
    $scope.clients = parentScope.clients;
    
    $scope.ok = function () {
        $uibModalInstance.close($scope.selectedMyCase);
    };

    $scope.cancel = function () {
        $uibModalInstance.dismiss('cancel');
    };
});

angular.module('yeomanApp').controller('AdvocatesToMyCaseModalInstanceCtrl', function ($scope, $uibModalInstance, parentScope) {

    $scope.selectedMyCase = parentScope.selectedMyCase;
    $scope.clients = parentScope.clients;
    
    $scope.ok = function () {
        $uibModalInstance.close($scope.selectedMyCase);
    };

    $scope.cancel = function () {
        $uibModalInstance.dismiss('cancel');
    };
});

angular.module('yeomanApp').controller('MyCaseDeleteConfirmationModalInstanceControl', function ($scope, $uibModalInstance, parentScope) {

    $scope.selectedMyCase = parentScope.selectedMyCase;


    $scope.ok = function () {
        $uibModalInstance.close($scope.selectedMyCase);
    };

    $scope.cancel = function () {
        $uibModalInstance.dismiss('cancel');
    };
});