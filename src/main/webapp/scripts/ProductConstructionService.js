'use strict';

productConstructionApp.factory('ProductConstructionService', function ($http, $rootScope, $q, $window, $resource) {

	return {

		fetchAllProductConstruction : function () {
			var ressourceResultQuery = $resource('http://localhost:8083/factorymanagment/allProductConstruction/').query();

			ressourceResultQuery.$promise.then(
        //success
        function( value ){
		return value;
		},
        //error
        function( error ){
		$window.alert(error);
		}
      );
			return ressourceResultQuery;

		},

		saveProductConstruction : function (productConstruction) {
			var productConstructionToSend = {

				"id" : productConstruction.id,
				"productId" : productConstruction.product.id,
				"productDuration" : productConstruction.productDuration

			};
			var jsonProductConstructionToSend = JSON.stringify(productConstructionToSend);
			var a = $http.post(
					'http://localhost:8083/factorymanagment/createProductConstruction/',
					productConstructionToSend).then(function (response) {
					// $rootScope.refresh();
					$rootScope.$broadcast('saveProductConstructionWithSuccess', response.data);
					return response.data;
				}, function (errResponse) {
					window.alert(errResponse);
					console.error('Error while creating productConstruction');
					return $q.reject(errResponse);
				});

			return null;
		},

		updateProductConstruction : function (productConstruction) {
			var productConstructionToSend = {

				"id" : productConstruction.id,
				"productId" : productConstruction.product.id,
				"productDuration" : productConstruction.productDuration

			};

			return $http.put(
				'http://localhost:8083/factorymanagment/updateProductConstruction/',
				userToSend).then(function (response) {
				return response.data;
			}, function (errResponse) {
				console.error('Error while updating productConstruction');
				return $q.reject(errResponse);
			});
		},

		deleteProductConstruction : function (productConstruction) {
			var productConstructionToSend = {

				"id" : productConstruction.id,
				"productId" : productConstruction.product.id,
				"productDuration" : productConstruction.productDuration

			};

			$http({
				url : 'http://localhost:8083/factorymanagment/deleteProductConstruction/',
				method : 'DELETE',
				data : productConstructionToSend,
				headers : {
					"Content-Type" : "application/json;charset=utf-8"
				}
			}).then(function (response) {
				$rootScope.$broadcast('deleteProductConstructionWithSuccess', response.data);
				return response.data;
			}, function (errResponse) {
				console.error('Error while deleting productConstruction');
				return $q.reject(errResponse);
			});
			return null;
		}
	};

});
