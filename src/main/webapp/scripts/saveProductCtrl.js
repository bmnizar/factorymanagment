'use strict';
App.controller('SaveProductCtrl', function ($scope, UserService, $rootScope, $filter, NgTableParams, $resource, $log) {
	// var self=this;
	var self = this;
	self.products = [];
	var product = {

		"id" : '',
		"refProduct" : '',
		"nameProduct" : '',
		"priceProduct" : '',
		"category" : ''
	};

	self.fetchAllProducts = function () {

		UserService
		.fetchAllProducts()
		.then(
			function (allProductsFromServer) {

			self.product = allProductsFromServer;
			$scope.tableParams = new NgTableParams({
					page : 1, // show first page
					count : 5, // count per page
					sorting : {
						nameProduct : 'asc' // initial sorting
					},
					filter : {
						nameProduct : '' // initial filter
					}
				}, {
					total : allProductsFromServer.length, // length of data
					getData : function ($defer, params) {
						// use build-in angular filter
						var isFilter = params.filter();
						var filteredData = isFilter ?
							$filter('filter')(allProductsFromServer, isFilter) :
							allProductsFromServer;
						var oderByy = params.orderBy();
						var isSorting = params.sorting();
						var orderedData = isSorting ?
							$filter('orderBy')(filteredData, oderByy) : filteredData;

						$defer.resolve(orderedData.slice((params.page() - 1) * params.count(), params.page() * params.count()));
					}
				});
			console
			.log('----------Start Printing users----------');
			for (var i = 0; i < self.products.length; i++) {
				console
				.log('refProduct '
					 + self.products[i].refProduct);
			}

			console
			.log('----------End Printing users----------');
		},
			function (errResponse) {
			window.alert(errResponse);
			console
			.error('Error while fetching Currencies');
		});
	};

	self.addProduct = function (product) {
		UserService.saveProduct(product)
		$log.log("saving product");

		$rootScope.$on('saveProductWithSuccess', function (event,
				data) {

			self.fetchAllProducts();
		});
	};

	self.fetchAllProducts();

});
