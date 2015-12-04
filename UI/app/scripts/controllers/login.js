'use strict';

angular.module('yeomanApp')
  .controller('LoginCtrl', function ($scope, $rootScope, $location, LoginService) {
    
      $scope.data = {
          userName: "",
          password: "",
          phonenumber: "",
          useRefreshTokens: false
      };

      $scope.userdata ={
          "UserName": "",
          "Email": "",
          "Password": "",
          "ConfirmPassword": "",
          "Name": "",
          "PhoneNumber": "",
          "Address": ""
      }

      $scope.login = function () {
          LoginService.loginUser($scope.data)
              .then(function (response) {
                  $location.path('/');
              },
         function (err) {
             $scope.message = err.error_description;
         });
      }
      $scope.register = function () {
          $scope.userdata.UserName = $scope.userdata.Email;
          LoginService.register($scope.userdata)
              .then(function (response) {
                  $location.path('/');
              },
         function (err) {
             $scope.message = err.error_description;
         });
      }
          //.success(function (data) {
          //    $rootScope.isAuthenticated = sessionStorage.getItem("lastname");
          //    $location.path('/');
          //}).error(function (data) {
          //     alert('Login failed! Please check your credentials!');
          //});
          
          //console.log("LOGIN user: " + $scope.data.username + " - PW: " + $scope.data.password);
      


  });
