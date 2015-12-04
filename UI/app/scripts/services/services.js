angular.module('yeomanApp')
    .service('LoginService', ['$http', '$q', 'localStorageService', 'ngAuthSettings', function ($http, $q, localStorageService, ngAuthSettings) {
        var serviceBase = ngAuthSettings.apiServiceBaseUri;

        var loginService = {};
        this.authentication = {
            isAuth: false,
            userName: "",
            useRefreshTokens: false
        };

        this.loginUser1 = function (name, pw) {
            var deferred = $q.defer();
            var promise = deferred.promise;
            var userData = { username: 'ravikumargh13@gmail.com', password: 'password' };

            //if (name == userData.username && pw == userData.password) {
            if (name && pw) {
                deferred.resolve('Welcome ' + name + '!');
            } else {
                deferred.reject('Wrong credentials.');
            }
            promise.success = function (fn) {
                sessionStorage.setItem("lastname", "ravikumargh13@gmail.com");
                promise.then(fn);
                return promise;
            }
            promise.error = function (fn) {
                promise.then(null, fn);
                return promise;
            }
            return promise;
        };

        this.loginUser = function (loginData) {

            var data = "grant_type=password&username=" + loginData.userName + "&password=" + loginData.password;

            if (loginData.useRefreshTokens) {
                data = data + "&client_id=" + ngAuthSettings.clientId;
            }

            var deferred = $q.defer();

            $http.post(serviceBase + 'token', data, { headers: { 'Content-Type': 'application/x-www-form-urlencoded' } }).success(function (response) {

                if (loginData.useRefreshTokens) {
                    localStorageService.set('authorizationData', { token: response.access_token, userName: loginData.userName, refreshToken: response.refresh_token, useRefreshTokens: true });
                }
                else {
                    localStorageService.set('authorizationData', { token: response.access_token, userName: loginData.userName, refreshToken: "", useRefreshTokens: false });
                }
                loginService.authentication.isAuth = true;
                loginService.authentication.userName = loginData.userName;
                loginService.authentication.useRefreshTokens = loginData.useRefreshTokens;

                deferred.resolve(response);

            }).error(function (err, status) {
                _logOut();
                deferred.reject(err);
            });

            return deferred.promise;

        };

        this.register = function (loginData) {

            //var data = "grant_type=password&username=" + loginData.userName + "&password=" + loginData.password;

            //if (loginData.useRefreshTokens) {
            //    data = data + "&client_id=" + ngAuthSettings.clientId;
            //}

            var deferred = $q.defer();

            $http.post(serviceBase + 'api/User', loginData, { headers: { 'Content-Type': 'application/json' } }).success(function (response) {

                //if (loginData.useRefreshTokens) {
                //    localStorageService.set('authorizationData', { token: response.access_token, userName: loginData.userName, refreshToken: response.refresh_token, useRefreshTokens: true });
                //}
                //else {
                //    localStorageService.set('authorizationData', { token: response.access_token, userName: loginData.userName, refreshToken: "", useRefreshTokens: false });
                //}
                //loginService.authentication.isAuth = true;
                //loginService.authentication.userName = loginData.userName;
                //loginService.authentication.useRefreshTokens = loginData.useRefreshTokens;

                deferred.resolve(response);

            }).error(function (err, status) {
                loginService.logOut();
                deferred.reject(err);
            });

            return deferred.promise;

        };

        this.logOut = function () {

            localStorageService.remove('authorizationData');

            loginService.authentication.isAuth = false;
            loginService.authentication.userName = "";
            loginService.authentication.useRefreshTokens = false;

        };

        loginService = this;
        return this;
}]);