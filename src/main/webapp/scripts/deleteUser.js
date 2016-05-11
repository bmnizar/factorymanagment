App.controller('DeleteUserCtrl', function($rootScope, UserService, $uibModal,
		$scope, $log, $uibModalStack) {

	var self = this;
	self.user = {
		id : '',
		firstName : '',
		lastName : '',
		password : '',
		email : '',
		phoneNumber : '',
		address : '',
		role : ''
	};

	var modalInstance;

});