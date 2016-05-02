'use strict';
App.controller('DeleteUserModalCtrl', function($scope,parent,selectedUserToDelete,$uibModalInstance) {
 /////// Button Cancel/////////////
 	$scope.cancel = function () {
    $uibModalInstance.dismiss('cancel');
  }
var parent;
var selectedUserToDelete;
this.selectedUserToDelete=selectedUserToDelete;
this.parent = parent;   
  
 
});