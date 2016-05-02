
<form role="form">
	<div class="modal-header">
		<button type="button" class="close" data-dismiss="modal"
			aria-hidden="true">&times;</button>
		<h4 class="modal-title">
			<span class="glyphicon glyphicon-user"></span>&nbsp;&nbsp;Ajouter
			utilisateur
		</h4>
	</div>

	<div class="modal-body">

		<div class="row">
			<div class="col-md-6">

				<div class="form-group">
					<label for="FirstName" class="control-label">Nom</label> <input
						type="text" ng-model="CreateUserModalCtrl.parent.user.firstName"
						class="form-control" id="FirstName" placeholder="Votre Nom">
				</div>

			</div>

			<div class="col-md-6">

				<div class="form-group">
					<label for="LastName" class="control-label">Prenom</label> <input
						type="text" id="LastName"
						ng-model="CreateUserModalCtrl.parent.user.lastName"
						class="form-control" placeholder="Votre Prenom">
				</div>

			</div>
		</div>

		<div class="row">
			<div class="col-md-6">

				<div class="form-group">
					<label for="pwd" class="control-label">Mot De Passe</label> <input
						type="password" id="pwd"
						ng-model="CreateUserModalCtrl.parent.user.password"
						class="form-control" placeholder="Votre Mot de passe">
				</div>
			</div>
			<div class="col-md-6">

				<div class="form-group">
					<label for="email" class="control-label">Email</label> <input
						type="email" ng-model="CreateUserModalCtrl.parent.user.email"
						class="form-control" id="email" placeholder="Votre Mot de passe">
				</div>

			</div>
		</div>
		<div class="row">
			<div class="col-md-12">

				<div class="form-group">
					<label for="field-5" class="control-label">Adresse</label> <input
						type="text" class="form-control " id="field-5"
						placeholder="Votre Adresse">
				</div>

			</div>
		</div>

		<div class="row">
			<div class="col-md-6">

				<div class="form-group">
					<label for="field-6" class="control-label">Télephone</label> <input
						type="text" id="PhoneNumber"
						ng-model="CreateUserModalCtrl.parent.user.phoneNumber"
						class="form-control" placeholder="Votre Télephone">
				</div>

			</div>

			<div class="col-md-6">

				<div class="form-group">
					<label for="field-7" class="control-label">Role</label>
					<div class="form-group">
						<select class="selectpicker form-control"
							title="Choose one of the following..." data-width="auto">
							<option>Responsable de Commande</option>
							<option>Responsable de production</option>

						</select>
					</div>
				</div>
			</div>
		</div>

		<div class="modal-footer">
			<div class="row">
				<button id="submit" value="Sauvegarder" type="button"
					class="btn col-xs-6 btn-success"
					ng-click="CreateUserModalCtrl.parent.saveUser(CreateUserModalCtrl.parent.user)">
					<span class="glyphicon glyphicon-saved"></span>Sauvegarde
				</button>
				<button name="submit" id="submit" value="Annuler" type="button"
					class="btn col-xs-5 btn-warning" style="float: right;">
					<span class="glyphicon glyphicon-remove"></span>Cancel
				</button>
			</div>
		</div>

		<!-- <label for="FirstName">FirstName</label> 
									<input type="text"ng-model="CreateUserModalCtrl.parent.user.firstName"class="form-control" id="FirstName" placeholder="Enter FirstName" />
								<label for="text">LastName</label> 
									<input type="text"class="form-control" id="LastName"ng-model="CreateUserModalCtrl.parent.user.lastName"
										placeholder="Enter lastName" />
								<label for="pwd">Password</label> 
									<input class="form-control" id="pwd"ng-model="CreateUserModalCtrl.parent.user.password"
										type="password" placeholder="Enter Password" />
								<label for="email">Emailaddress</label> 
									 <input type="email"ng-model="CreateUserModalCtrl.parent.user.email" class="form-control"
											id="email" placeholder="Enter email" />
								<label for="phoneNumber">PhoneNumber</label> 
									<input type="text" class="form-control" id="PhoneNumber"ng-model="CreateUserModalCtrl.parent.user.phoneNumber"
										placeholder="Enter PhoneNumber" />
								<label for="homeAddressLocation">Home Address</label> 
									<input class="form-control" ng-model="CreateUserModalCtrl.parent.user.location"
										type="text"id="homeAddressLocation" placeholder="homeAddressLocation" />
							<div class="dropdown">
								<label  for="Role">Role</label>
									<select class="selectpicker" ng-model="CreateUserModalCtrl.parent.user.role">
  <option>Mustard</option>
  <option>Ketchup</option>
  <option>Relish</option>
</select>

											<br/>
							</div>
					
							<button id="submit"  value="Sauvegarder" type="button" class="btn col-xs-6 btn-success" 	ng-click="CreateUserModalCtrl.parent.saveUser(CreateUserModalCtrl.parent.user)"><span class="glyphicon glyphicon-saved"></span> Save</button> 
							 <button name="submit" id="submit"  value="Annuler" type="but */ton" class="btn col-xs-6 btn-warning"  style="float:right;"><span class="glyphicon glyphicon-remove"></span>Cancel</button>-->
</form>


