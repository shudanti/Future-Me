'use strict';
angular.module('myApp', ['ngMessages']);
var myApp = angular.module('myApp');
var managerApp = angular.module('managerApp', []);

myApp.directive('containDigitAndLetter',
  ['$http', function ($http) {

      return {
          require: 'ngModel',
          link: function (scope, element, attrs, ngModel) {
              var regular = /^([0-9]+[a-zA-Z]+|[a-zA-Z]+[0-9]+)[0-9a-zA-Z]*$/;

              ngModel.$parsers.push(function (value) {
                  if (new RegExp(regular).test(value))
                  {
                      ngModel.$setValidity('containDigitAndLetter', true);
                  }
                  else {
                      ngModel.$setValidity('containDigitAndLetter', false);
                  }
              })
          }
      }
  }]);
managerApp.factory('clientId', function clientIdFactory() {
    return 'a12345654321x';
});

managerApp.factory('myService', function ($window) {
    var KEY = 'managerApp.SelectedMail';
    var savedData = {}
    function set(data) {
        savedData = data;
        $window.sessionStorage.setItem(KEY, JSON.stringify(data));
    }
    function get() {
        var savedData = $window.sessionStorage.getItem(KEY);
        if (savedData) {
            savedData = JSON.parse(savedData);
        }
        return savedData;
    }

    return {
        set: set,
        get: get
    }

});
