'use strict';
var App = angular.module('myApp',['ngCookies', 'ngMessages','ngResource', 'ngRoute','ui.bootstrap','ngTable','ngMessages']);//App
//.factory('XSRFInterceptor', function ($cookies, $log) {
//
//  var XSRFInterceptor = {
//
//    request: function(config) {
//
//      var token = $cookies.get('XSRF-TOKEN');
//
//      if (token) {
//        config.headers['X-XSRF-TOKEN'] = token;
//        $log.info("X-XSRF-TOKEN: " + token);
//      }
//
//      return config;
//    }
//  };
//  return XSRFInterceptor;
//});
//
//App
//  .config(['$httpProvider', function ($httpProvider) {
//
//    $httpProvider.defaults.withCredentials = true;
//    $httpProvider.interceptors.push('XSRFInterceptor');
//
//  }]);




