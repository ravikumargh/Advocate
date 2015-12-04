'use strict';

/**
 * @ngdoc function
 * @name yeomanApp.controller:AboutCtrl
 * @description
 * # AboutCtrl
 * Controller of the yeomanApp
 */
angular.module('yeomanApp')
  .controller('MenuCtrl', function ($scope, $location, $rootScope) {
      $scope.logout = function () {
          sessionStorage.setItem("lastname", null);
          $rootScope.isAuthenticated = null;
          $location.path('/');
      }

      $scope.menuClick = function () {
          if ($('.navbar-toggle').css('display')=='block') {
            $('.navbar-toggle').click();
          }
      }

      //$(function () {
      //    $('.nav a').on('click touchstart', function () {
      //        if ($('.navbar-toggle').css('display') != 'none') {
      //            $(".navbar-toggle").trigger("click");
      //        }
      //    });
      //    $('.nav-collapse').click('li', function () {
      //        $('.nav-collapse').collapse('hide');
      //    });
      //});
  });
