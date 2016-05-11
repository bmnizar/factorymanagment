'use strict';
productConstructionApp.factory('ProductConstructionService', function ($http, $rootScope, $q, $window, $resource) {

	return {

		fetchAllProductConstruction : function () {
			return $http
			.get('http://localhost:8083/factorymanagment/allProductConstruction/')
			.then(function (response) {
				return response.data;
			}, function (errResponse) {
				console.error('Error while fetching users');
				return $q.reject(errResponse);
			});

		},

		saveProductConstruction : function (productConstruction) {
			var productConstructionToSend = {

				"id" : productConstruction.id,
				"relatedProductName" : productConstruction.relatedProductName,
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
				"relatedProductName" : productConstruction.relatedProductName,
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
				"relatedProductName" : productConstruction.relatedProductName,
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
