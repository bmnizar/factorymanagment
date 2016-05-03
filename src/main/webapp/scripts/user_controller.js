'use strict';

App.controller(
	'UserController',
	function ($scope, UserService, $window, $log, $uibModalStack, $uibModal, $rootScope, $filter, NgTableParams, $resource) {
	var self = this;
	self.users = [];
	var user = {
		id : null,
		firstName : '',
		lastName : '',
		password : '',
		email : '',
		phoneNumber : '',
		address : '',
		role : ''
	};

	self.fetchAllUsers = function () {

		/*
		var Api = $resource("http://localhost:8083/factorymanagment/allUsers/");
		this.tableParams = new NgTableParams({}, {
		getData : function (params) {
		var urll=params.url();
		return Api.get(urll).$promise.then(function (data) {
		self.data = data;
		params.total(users.inlineCount); // recal. page nav controls
		return data.results;
		});
		}
		});*/

		UserService
		.fetchAllUsers()
		.then(
			function (allUsersFromServer) {

			self.users = allUsersFromServer;
			$scope.tableParams = new NgTableParams({
					page : 1, // show first page
					count : 5, // count per page
					sorting : {
						firstName : 'asc' // initial sorting
					},
					filter : {
						firstName : '' // initial filter
					}
				}, {
					total : allUsersFromServer.length, // length of data
					getData : function ($defer, params) {
						// use build-in angular filter
						var isFilter = params.filter();
						var filteredData = isFilter ?
							$filter('filter')(allUsersFromServer, isFilter) :
							allUsersFromServer;
						var oderByy = params.orderBy();
						var isSorting = params.sorting();
						var orderedData = isSorting ?
							$filter('orderBy')(filteredData, oderByy) : filteredData;

						$defer.resolve(orderedData.slice((params.page() - 1) * params.count(), params.page() * params.count()));
					}
				});
			console
			.log('----------Start Printing users----------');
			for (var i = 0; i < self.users.length; i++) {
				console
				.log('FirstName '
					 + self.users[i].firstName);
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
	self.saveUser = function (user) {

		UserService.createUser(user);
		$log.log("saving user");
		$uibModalStack.dismissAll();

		$rootScope.$on('saveUserWithSuccess', function (event,
				data) {

			self.fetchAllUsers();

		});
	};
	self.openCreateUser = function () {
		var modalInstance = $uibModal.open({
				animation : true,
				templateUrl : 'createUserContent',
				controller : 'CreateUserModalCtrl',
				controllerAs : 'CreateUserModalCtrl', // as modal so no need to use in modal template
				resolve : {
					items : function () {
						$log.info('check ' + $scope.CreateUserModalCtrl);
						return $scope.items;
					},
					parent : function () { // pass self object as a parent to 'ModalCtrl'
						$log.info('check ' + $scope.CreateUserModalCtrl);
						self.user = {
							id : '',
							firstName : '',
							lastName : null,
							password : null,
							email : '',
							phoneNumber : '',
							address : '',
							role : ''
						};
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
	self.openDeleteUser = function (selectedUserToDelete) {

		var modalInstance = $uibModal.open({
				animation : true,
				templateUrl : 'deleteUserContent',
				controller : 'DeleteUserModalCtrl',
				controllerAs : 'DeleteUserModalCtrl', // as modal so no need to use in
				// modal template
				resolve : {
					selectedUserToDelete : function () {
						return selectedUserToDelete;
					},
					parent : function () { // pass self object as a parent to 'ModalCtrl'
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

	self.deleteUser = function (user) {

		UserService.deleteUser(user);
		$uibModalStack.dismissAll();
		$rootScope.$on('deleteUserWithSuccess', function (event,
				data) {

			self.fetchAllUsers();

		});
	};

	self.reset = function () {
		self.user = {
			id : null,
			firstName : '',
			lastName : '',
			password : '',
			email : '',
			phoneNumber : '',
			address : '',
			role : ''
		};
		$scope.myForm.$setPristine(); //reset Form
	};

	self.openEditUser = function (user) {

		var modalInstance = $uibModal.open({
				animation : true,
				templateUrl : 'editUserContent',
				controller : 'UserController',
				resolve : {
					items : function () {
						return $scope.items;
					}
				}
			});

		modalInstance.result.then(function (selectedItem) {
			$scope.selected = selectedItem;
		}, function () {
			$log.info('Modal dismissed at: ' + new Date());
		});
	};

	self.fetchAllUsers();
});
