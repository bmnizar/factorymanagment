'use strict';
productConstructionApp
.controller(
	'ProductConstructionCalculationApp',
	function ($scope, ProductConstructionService, $rootScope, UserService,
		$filter,  $resource, $log, $uibModal,$uibModalStack) {

	var self = this;
	
	self.listOfProducts = [];
	self.calculateProductConstructionTime = function (productName) {
		return "10";
	}
	self.fetchAllProducts = function () {
		UserService
		.fetchAllProducts()
		.then(
			function (
				dataFromServer) {
			self.listOfProducts = dataFromServer;
		},
			function (errResponse) {
			window.alert(errResponse);
			console
			.error('Error while fetching Currencies');
		});
	};
	

});
