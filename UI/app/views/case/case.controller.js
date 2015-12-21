'use strict';

/**
 * @ngdoc function
 * @name yeomanApp.controller:AboutCtrl
 * @description
 * # AboutCtrl
 * Controller of the yeomanApp
 */
angular.module('yeomanApp')
  .controller('CaseController', ['$scope', 'CaseService', '$uibModal', '$log', 'UserService', function ($scope, CaseService, $uibModal, $log, UserService) {

      $scope.newcase = {
          'Name': '' 
      }

    
      $scope.init = function () {

          $scope.cases = null;

          CaseService.getCases()
              .then(function (response) {
                  $scope.cases = response.data;
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

      $scope.deleteCase = function (_case) {
          CaseService.deleteCase(_case.Id).then(function (response) {
              //_.remove($scope.cases, function (_case) {
              //    return _case.Id;
              //});
              $scope.init();
          },
            function (err) {
                $scope.error = err;
            });
      }
      $scope.createNewCase = function () {
          $scope.error = undefined;
          //if (!$scope.newcase.name) {
          //    $scope.error = 'Please enter valid _case name.';
          //    return;
          //}
          //$scope.newcase.Name = "Case 1";
          $scope.addNew($scope.newcase);
      };

      $scope.addNew = function (newcase) {
          CaseService.addNewCase(newcase).then(function (response) {
              $scope.init();
          },
          function (err) {

          });
      }

      $scope.update = function (_case) {
          CaseService.updateCase(_case).then(function (response) {
              $scope.init();
          },
          function (err) {

          });
      }
      
      $scope.editCaseModel = function (_case) {
          $scope.selectedCase = angular.copy(_case);

          var modalInstance = $uibModal.open({
              animation: $scope.animationsEnabled,
              templateUrl: 'CaseModalContent.html',
              controller: 'CaseModalInstanceCtrl',
              size: 'sm',
              animation: true,
              resolve: {
                  parentScope: function () {
                      return $scope;
                  }
              }
          });

          modalInstance.result.then(function (_case) {
              $scope.update(_case);
          }, function () {
              $log.info('Modal dismissed at: ' + new Date());
          });
      }
      
      $scope.openNewCaseModel = function () {
          $scope.selectedCase= $scope.newcase;
          var modalInstance = $uibModal.open({
              animation: $scope.animationsEnabled,
              templateUrl: 'CaseModalContent.html',
              controller: 'CaseModalInstanceCtrl',
              size: 'sm',
              animation: true,
              resolve: {
                  parentScope: function () {
                      return $scope;
                  }
              }
          });

          modalInstance.result.then(function (newCase) {
              $scope.addNew(newCase);
          }, function () {
              $log.info('Modal dismissed at: ' + new Date());
          });
      };
      $scope.deleteCaseModel = function (_case) {
          $scope.selectedCase = _case;
          var modalInstance = $uibModal.open({
              animation: $scope.animationsEnabled,
              templateUrl: 'CaseDeleteConfirmationModalContent.html',
              controller: 'CaseDeleteConfirmationModalInstanceControl',
              size: 'sm', 
              animation: true,
              resolve: {
                  parentScope: function () {
                      return $scope;
                  }
              }
          });

          modalInstance.result.then(function (selectedCase) {
              $scope.deleteCase(selectedCase);
          }, function () {
              $log.info('Modal dismissed at: ' + new Date());
          });
      };
      
      $scope.addAdvocatesToCaseModel = function (_case) {
              $scope.selectedCase = angular.copy(_case);

              var modalInstance = $uibModal.open({
                  animation: $scope.animationsEnabled,
                  templateUrl: 'AdvocatesToCaseModalContent.html',
                  controller: 'AdvocatesToCaseModalInstanceCtrl',
                  size: 'sm',
                  animation: true,
                  resolve: {
                      parentScope: function () {
                          return $scope;
                      }
                  }
              });

              modalInstance.result.then(function (_case) {
                  $scope.update(_case);
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


angular.module('yeomanApp').controller('CaseModalInstanceCtrl', function ($scope, $uibModalInstance, parentScope) {

    $scope.selectedCase = parentScope.selectedCase;
    $scope.clients = parentScope.clients;
    
    $scope.ok = function () {
        $uibModalInstance.close($scope.selectedCase);
    };

    $scope.cancel = function () {
        $uibModalInstance.dismiss('cancel');
    };
});

angular.module('yeomanApp').controller('AdvocatesToCaseModalInstanceCtrl', function ($scope, $uibModalInstance, parentScope) {

    $scope.selectedCase = parentScope.selectedCase;
    $scope.clients = parentScope.clients;
    
    $scope.ok = function () {
        $uibModalInstance.close($scope.selectedCase);
    };

    $scope.cancel = function () {
        $uibModalInstance.dismiss('cancel');
    };
});

angular.module('yeomanApp').controller('CaseDeleteConfirmationModalInstanceControl', function ($scope, $uibModalInstance, parentScope) {

    $scope.selectedCase = parentScope.selectedCase;


    $scope.ok = function () {
        $uibModalInstance.close($scope.selectedCase);
    };

    $scope.cancel = function () {
        $uibModalInstance.dismiss('cancel');
    };
});