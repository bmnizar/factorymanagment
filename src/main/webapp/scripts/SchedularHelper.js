SchedularCalendarApp.factory('alert', function ($uibModal) {

	function show(action, event) {
		return $uibModal.open({
			templateUrl : 'SchedularModalContent',
			controller : function () {
				var vm = this;
				vm.action = action;
				vm.event = event;
			},
			controllerAs : 'vm'
		});
	}

	return {
		show : show
	};

});
