'use strict';
ProductConstructionCalculationApp
.controller(
	'ProductConstructionCalculationCtrl',
	function ($scope, ProductConstructionService, $rootScope, UserService,$http,
		$filter,  $resource, $log, $uibModal,$uibModalStack) {

	var self = this;
	self.selectedProduct='';
	self.listOfProducts = [];
	self.result='';
	self.quantityOfProducts='';
	self.calculateProductConstructionTime = function (productName) {
	var toBeSent=[];
	toBeSent[0]=self.selectedProduct;
	toBeSent[1]=self.quantityOfProducts;
	var toBeSentJson=JSON.stringify(toBeSent);
	$http
			.post('http://localhost:8083/factorymanagment/calculateProductConstructionTime/',toBeSentJson)
			.then(function (response) {
				self.result=	response.data;
				return response.data;
			}, function (errResponse) {
				console.error('Error while fetching users');
				return $q.reject(errResponse);
			});
		return "10";
	}
	self.fetchAllProducts = function () {
	$http
			.get('http://localhost:8083/factorymanagment/fetchRelatedProducts/')
			.then(function (response) {
				self.listOfProducts=response.data;
				return response.data;
			}, function (errResponse) {
				console.error('Error while fetching users');
				return $q.reject(errResponse);
			});
	};
		self.fetchAllProducts();

});
