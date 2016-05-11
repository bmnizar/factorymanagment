'use strict';
productApp.factory('ProductService', function ($http, $rootScope, $q, $window, $resource) {

	return {

		fetchAllProduct : function () {
			return $http
			.get('http://localhost:8083/factorymanagment/allProduct/')
			.then(function (response) {
				return response.data;
			}, function (errResponse) {
				console.error('Error while fetching products');
				return $q.reject(errResponse);
			});

		},

		saveProduct : function (product) {
			var productToSend = {

				"id" : product.id,
				"refProduct" : product.refProduct,
				"nameProduct" : product.nameProduct,
				"priceProduct" : product.priceProduct,
				"category" : product.category,
				"productDuration" : product.productDuration

			};
			var jsonProductToSend = JSON.stringify(productToSend);
			var a = $http.post(
					'http://localhost:8083/factorymanagment/createProduct/',
					productToSend).then(function (response) {
					// $rootScope.refresh();
					$rootScope.$broadcast('saveProductWithSuccess', response.data);
					return response.data;
				}, function (errResponse) {
					window.alert(errResponse);
					console.error('Error while creating product');
					return $q.reject(errResponse);
				});

			return null;
		},

		updateProduct : function (product) {
		var productToSend = {

				"id" : product.id,
				"refProduct" : product.refProduct,
				"nameProduct" : product.nameProduct,
				"priceProduct" : product.priceProduct,
				"category" : product.category,
				"productDuration" : product.productDuration

			};

			return $http.put(
				'http://localhost:8083/factorymanagment/updateProduct/',
				userToSend).then(function (response) {
				return response.data;
			}, function (errResponse) {
				console.error('Error while updating product');
				return $q.reject(errResponse);
			});
		},

		deleteProduct : function (product) {
		var productToSend = {

				"id" : product.id,
				"refProduct" : product.refProduct,
				"nameProduct" : product.nameProduct,
				"priceProduct" : product.priceProduct,
				"category" : product.category,
				"productDuration" : product.productDuration

			};

			$http({
				url : 'http://localhost:8083/factorymanagment/deleteProduct/',
				method : 'DELETE',
				data : productToSend,
				headers : {
					"Content-Type" : "application/json;charset=utf-8"
				}
			}).then(function (response) {
				$rootScope.$broadcast('deleteProductWithSuccess', response.data);
				return response.data;
			}, function (errResponse) {
				console.error('Error while deleting product');
				return $q.reject(errResponse);
			});
			return null;
		}
	};

});
