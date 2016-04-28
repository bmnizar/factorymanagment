'use strict';

App.controller(
	'UserController',
	function ($scope, UserService, $window, $log,
		$uibModalStack, $uibModal, $rootScope) {
	var self = this;
	self.users = [];
	var user = {
	id:"",
	firstName : '',
	lastName : '',
	password:'',
	email : '',
	phoneNumber:'',
	address : '',
	role: ''
	};
	self.fetchAllUsers = function () {
		UserService
		.fetchAllUsers()
		.then(
			function (d) {

			self.users = d;
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
				controllerAs:'CreateUserModalCtrl', // as modal so no need to use in modal template
				resolve : {
					items : function () {
						return $scope.items;
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
//	 Open Modal Button Delete
	self.openDeleteUser = function (selectedUserToDelete) {
		
		var modalInstance = $uibModal.open({
			animation : true,
			templateUrl : 'deleteUserContent',
			controller : 'DeleteUserModalCtrl',

		    resolve: {
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
		  self.deleteUser = function(){
              UserService.deleteUser(null)
                      .then(
                              self.fetchAllUsers, 
                              function(errResponse){
                                   console.error('Error while deleting User.');
                              } 
                  );
				  $uibModalStack.dismissAll();
          };
 
		modalInstance.result.then(function (selectedItem) {
			$scope.selected = selectedItem;
		}, function () {
			$log.info('Modal dismissed at: ' + new Date());
		});
	};

	self.fetchAllUsers();
});
