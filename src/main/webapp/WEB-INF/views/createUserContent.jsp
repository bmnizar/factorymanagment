
					<form role="form"> 
							 	<label for="FirstName">FirstName</label> 
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
							 <button name="submit" id="submit"  value="Annuler" type="button" class="btn col-xs-6 btn-warning"  style="float:right;"><span class="glyphicon glyphicon-remove"></span>Cancel</button>

        			 </form>
  		      

