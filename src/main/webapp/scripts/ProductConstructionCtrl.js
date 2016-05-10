'use strict';
productConstructionApp
.controller(
	'ProductConstructionCtrl',
	function ($scope, ProductConstructionService, $rootScope, UserService,
		$filter, NgTableParams, $resource, $log, $uibModal,$uibModalStack) {

	var self = this;
	self.selectedproductConstruction = '';
	self.listOfProducts = [];

	var productConstruction = {

		"id" : '',
		"relatedProductName" : '',
		"relatedProductReference" : '',
		"productDuration" : ''

	};
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
	self.fetchAllProductConstruction = function () {

		ProductConstructionService
		.fetchAllProductConstruction()
		.then(
			function (
				allProductsConstructionFromServer) {

			$scope.productConstructionTableTableParams = new NgTableParams({
					page : 1, // show
					// first
					// page
					count : 5, // count per
					// page
					sorting : {
						relatedProductName : 'asc' // initial
						// sorting
					},
					filter : {
						relatedProductName : '',
						relatedProductReference : ''

					}
				}, {
					total : allProductsConstructionFromServer.length,

					getData : function (
						$defer, params) {

						var isFilter = params
							.filter();
						var filteredData = isFilter ? $filter(
								'filter')
							(
								allProductsConstructionFromServer,
								isFilter)
							 : allProductsFromServer;
						var oderByy = params
							.orderBy();
						var isSorting = params
							.sorting();
						var orderedData = isSorting ? $filter(
								'orderBy')
							(
								filteredData,
								oderByy)
							 : filteredData;

						$defer
						.resolve(orderedData
							.slice(
								(params
									.page() - 1)
								 * params
								.count(),
								params
								.page()
								 * params
								.count()));
					}
				});

		},
			function (errResponse) {
			window.alert(errResponse);
			console
			.error('Error while fetching Currencies');
		});
	};

	self.openEditProductConstruction = function () {
		var modalInstance = $uibModal.open({
				animation : true,
				templateUrl : 'editProductConstructionContent',
				controller : 'EditProductConstructionModalCtrl',
				controllerAs : 'EditProductConstructionModalCtrl', // as
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
					items : function () {

						return $scope.items;
					},
					parent : function () { // pass self object as a
						// parent to 'ModalCtrl'

						return self;
					}
				}
			});
		// });

		modalInstance.result.then(function (selectedItem) {
			$scope.selected = selectedItem;
		}, function () {
			$log.info('Modal dismissed at: ' + new Date());
		});
	};

	// Open Modal Button Delete
	self.tigerSelectedProductConstruction = function (
		productConstruction) {
		self.selectedproductConstruction = productConstruction;
	};

	// Open Modal Button Delete
	self.openDeleteProductConstruction = function (
		selectedProductConstructionToDelete) {

		var modalInstance = $uibModal
			.open({
				animation : true,
				templateUrl : 'deleteProductConstructionContent',
				controller : 'DeleteProductConstructionModalCtrl',
				controllerAs : 'DeleteProductConstructionModalCtrl', // as
				// modal
				// so
				// no
				// need
				// to
				// use
				// in
				// modal template
				resolve : {
					selectedProductConstructionToDelete : function () {
						return selectedProductConstructionToDelete;
					},
					parent : function () { // pass self
						// object as a
						// parent to
						// 'ModalCtrl'
						return self;
					}

				}
			});

		modalInstance.result.then(function (selectedItem) {
			$scope.selected = selectedItem;
		}, function () {
			$log.info('Modal dismissed at: ' + new Date());
		});
	};

	self.deleteProductConstruction = function (
		) {

		ProductConstructionService
		.deleteProductConstruction(self.selectedproductConstruction);
		$uibModalStack.dismissAll();
		$rootScope.$on('deleteProductConstructionWithSuccess',
			function (event, data) {
$uibModalStack.dismissAll();
			self.fetchAllProductConstruction();

		});
	};
	self.cancelProductConstruction = function () {

		$uibModalStack.dismissAll();

	};

	self.addProductConstruction = function (productConstruction) {
		ProductConstructionService
		.saveProductConstruction(productConstruction)
		$log.log("saving product");

		$rootScope.$on('saveProductConstructionWithSuccess',
			function (event, data) {

			self.fetchAllProductConstruction();
		});
	};
	self.fetchAllProducts();
	self.fetchAllProductConstruction();

});
