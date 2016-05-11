'use strict';
productApp.controller('ProductCtrl', function($scope, ProductService,
		$rootScope, UserService, $filter, NgTableParams, $resource, $log,
		$uibModal, $uibModalStack) {

	var self = this;
	self.selectedproduct = '';
	self.listOfProducts = [];

	var product = {

		"id" : '',
		"refProduct" : '',
		"nameProduct" : '',
		"priceProduct" : '',
		"category" : '',
		"productDuration" : ''

	};
	self.fetchAllProducts = function() {
		UserService.fetchAllProducts().then(function(dataFromServer) {
			self.listOfProducts = dataFromServer;
		}, function(errResponse) {
			window.alert(errResponse);
			console.error('Error while fetching Currencies');
		});
	};
	self.fetchAllProduct = function() {

		ProductService.fetchAllProduct().then(
				function(allProductsFromServer) {

					$scope.productTableTableParams = new NgTableParams({
						page : 1, // show
						// first
						// page
						count : 5, // count per
						// page
						sorting : {
							nameProduct : 'asc' // initial
						// sorting
						},
						filter : {
							nameProduct : '',
							refProduct : ''

						}
					}, {
						total : allProductsFromServer.length,

						getData : function($defer, params) {

							var isFilter = params.filter();
							var filteredData = isFilter ? $filter('filter')(
									allProductsFromServer, isFilter)
									: allProductsFromServer;
							var oderByy = params.orderBy();
							var isSorting = params.sorting();
							var orderedData = isSorting ? $filter('orderBy')(
									filteredData, oderByy) : filteredData;

							$defer.resolve(orderedData.slice(
									(params.page() - 1) * params.count(),
									params.page() * params.count()));
						}
					});

				}, function(errResponse) {
					window.alert(errResponse);
					console.error('Error while fetching Currencies');
				});
	};

	self.openEditProduct = function() {
		var modalInstance = $uibModal.open({
			animation : true,
			templateUrl : 'editProductContent',
			controller : 'EditProductModalCtrl',
			controllerAs : 'EditProductModalCtrl', // as
			// modal
			// so
			// no
			// need
			// to
			// use
			// in
			// modal
			// template
			resolve : {
				items : function() {

					return $scope.items;
				},
				parent : function() { // pass self object as a
					// parent to 'ModalCtrl'

					return self;
				}
			}
		});
		// });

		modalInstance.result.then(function(selectedItem) {
			$scope.selected = selectedItem;
		}, function() {
			$log.info('Modal dismissed at: ' + new Date());
		});
	};

	// Open Modal Button Delete
	self.triggerSelectedProduct = function(product) {
		var newProduct = angular.copy(product);
		self.selectedproduct = newProduct;
	};

	// Open Modal Button Delete
	self.openDeleteProduct = function(selectedProductToDelete) {

		var modalInstance = $uibModal.open({
			animation : true,
			templateUrl : 'deleteProductContent',
			controller : 'DeleteProductModalCtrl',
			controllerAs : 'DeleteProductModalCtrl', // as
			// modal
			// so
			// no
			// need
			// to
			// use
			// in
			// modal template
			resolve : {
				selectedProductToDelete : function() {
					return selectedProductToDelete;
				},
				parent : function() { // pass self
					// object as a
					// parent to
					// 'ModalCtrl'
					return self;
				}

			}
		});

		modalInstance.result.then(function(selectedItem) {
			$scope.selected = selectedItem;
		}, function() {
			$log.info('Modal dismissed at: ' + new Date());
		});
	};

	self.deleteProduct = function() {

		ProductService.deleteProduct(self.selectedproduct);
		$uibModalStack.dismissAll();
		$rootScope.$on('deleteProductWithSuccess', function(event, data) {
			$uibModalStack.dismissAll();
			self.fetchAllProduct();

		});
	};
	self.cancelProduct = function() {

		$uibModalStack.dismissAll();

	};

	self.addProduct = function(product) {
		ProductService.saveProduct(product)
		$log.log("saving product");

		$rootScope.$on('saveProductWithSuccess', function(event, data) {

			self.fetchAllProduct();
		});
	};
	self.fetchAllProducts();

});
