'use strict';

productConstructionApp
		.factory(
				'CommandService',
				function($http, $rootScope, $q, $window, $resource) {

					return {

						fetchAllCommands : function() {
							return $http
									.get(
											'http://localhost:8083/factorymanagment/fetchAllCommands/')
									.then(
											function(response) {
												return response.data;
											},
											function(errResponse) {
												console
														.error('Error while fetching commands');
												return $q.reject(errResponse);
											});

						},

						fetchRelatedProductsToCommand : function(command) {
							var commandToSend = {

								"id" : productConstruction.id,
								"relatedProductName" : productConstruction.relatedProductName,
								"productDuration" : productConstruction.productDuration

							};
							return $http
									.get(
											'http://localhost:8083/factorymanagment/fetchRelatedProductsToCommand/',
											commandToSend)
									.then(
											function(response) {
												return response.data;
											},
											function(errResponse) {
												console
														.error('Error while fetchRelatedProductsToCommand');
												return $q.reject(errResponse);
											});

							return null;
						}
					}
				}

		);
