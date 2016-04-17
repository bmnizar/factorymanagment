'use strict';

App.factory('UserService', function($http,$rootScope, $q, $window){

	return {
		
			fetchAllUsers: function() {
					return $http.get('http://localhost:8081/MyDirectory/allUsers/')
							.then(
									function(response){
										return response.data;
									}, 
									function(errResponse){
										console.error('Error while fetching users');
										return $q.reject(errResponse);
									}
							);
			},
		   
		    createUser: function(user){
		    var userToSend = {
						"firstName" : user.firstName,
						"lastName" : user.lastName,
						"homeAddress" : {location : user.homeAddress.location}	,
						"email" : user.email,
						"ssoId": user.ssoId
				};
					var a= $http.post('http://localhost:8081/MyDirectory/createUser/', userToSend)
							.then(
									function(response){
									  //$rootScope.refresh();
									  $rootScope.$broadcast('saveUserWithSuccess',response.data);
										return response.data;
									}, 
									function(errResponse){
									     window.alert(errResponse);
										console.error('Error while creating user');
										return $q.reject(errResponse);
									}
							);
						  
							return null;
		    },
		    
		    updateUser: function(user){
					return $http.put('http://localhost:8081/MyDirectory/updateUser/'+id, user)
							.then(
									function(response){
										return response.data;
									}, 
									function(errResponse){
										console.error('Error while updating user');
										return $q.reject(errResponse);
									}
							);
			},
		    
			deleteUser: function(user){
					return $http.delete('http://localhost:8081/MyDirectory/deleteUser/'+user)
							.then(
									function(response){
										return response.data;
									}, 
									function(errResponse){
										console.error('Error while deleting user');
										return $q.reject(errResponse);
									}
							);
			}
		
	};

});
