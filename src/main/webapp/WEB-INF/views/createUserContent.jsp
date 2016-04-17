
<form role="form">
	<div class="form-group">
		<label for="FirstName">FirstName</label> <input type="FirstName"
			ng-model="CreateUserModalCtrl.parent.user.firstName"
			class="form-control" id="FirstName" placeholder="Enter FirstName" />
		<label for="lastName">lastName</label> <input type="lastName"
			class="form-control" id="lastName"
			ng-model="CreateUserModalCtrl.parent.user.lastName"
			placeholder="Enter lastName" /> <label for="email">Email
			address</label> <input type="email"
			ng-model="CreateUserModalCtrl.parent.user.email" class="form-control"
			id="email" placeholder="Enter email" />
	</div>
	<div class="form-group">
		<label for="homeAddressLocation">Home Address</label> <input
			class="form-control"
			ng-model="CreateUserModalCtrl.parent.user.homeAddress.location"
			id="homeAddressLocation" placeholder="homeAddressLocation" />
	</div>
	<div class="form-group">
		<label for="SSOId">SSOId</label> <input class="form-control"
			ng-model="CreateUserModalCtrl.parent.user.ssoId" id="SSOId"
			placeholder="SSOId" />
	</div>
	<button type="submit" class="btn btn-default"
		ng-click="CreateUserModalCtrl.parent.saveUser(CreateUserModalCtrl.parent.user)">Save</button>
	<button type="submit" class="btn btn-default">Cancel</button>
</form>
