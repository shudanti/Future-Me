'use strict';
angular.module('myApp', ['myApp.directives']);
/* Controllers */
//function stageController($scope) {
//    $scope.pw1 = 'password';
//}
/* Directives */
angular.module('myApp.directives', [])
    .directive('pwCheck', [function () {
        return {
            require: 'ngModel',
            link: function (scope, elem, attrs, ctrl) {
                var firstPassword = '#' + attrs.pwCheck;
                elem.add(firstPassword).on('keyup', function () {
                    scope.$apply(function () {
                        // console.info(elem.val() === $(firstPassword).val());
                        ctrl.$setValidity('pwmatch', elem.val() === $(firstPassword).val());
                    });
                });
            }
        }
    }]);