
					<form role="form"> 
							 	<label for="FirstName">FirstName</label> 
									<input type="FirstName"ng-model="CreateUserModalCtrl.parent.user.firstName"class="form-control" id="FirstName" placeholder="Enter FirstName" />
								<label for="lastName">LastName</label> 
									<input type="LastName"class="form-control" id="LastName"ng-model="CreateUserModalCtrl.parent.user.lastName"
										placeholder="Enter lastName" />
								<label for="Password">Password</label> 
									<input type="Password"class="form-control" id="Password"ng-model="CreateUserModalCtrl.parent.user.password"
										placeholder="Enter Password" />
								<label for="email">Emailaddress</label> 
									 <input type="email"ng-model="CreateUserModalCtrl.parent.user.email" class="form-control"
											id="email" placeholder="Enter email" />
								<label for="lastName">PhoneNumber</label> 
									<input type="PhoneNumber" class="form-control" id="PhoneNumber"ng-model="CreateUserModalCtrl.parent.user.phoneNumber"
										placeholder="Enter PhoneNumber" />
								<label for="homeAddressLocation">Home Address</label> 
									<input class="form-control" ng-model="CreateUserModalCtrl.parent.user.homeAddress.location"
										id="homeAddressLocation" placeholder="homeAddressLocation" />
							<div class="dropdown">
								<label  for="Role">Role</label>
									<div class="controls">
											<button class="btn btn-default dropdown-toggle" type="button" data-toggle="dropdown">Select Role
												<span class="caret"></span></button>
										<ul class="dropdown-menu">
											<li><a href="#">Responsable de Commande</a></li>
											<li><a href="#">Responsable de  Production</a></li>
											<li><a href="#">Responsable de Qualité</a></li>
											<li><a href="#">Responsable de Maintenance</a></li>
										    <li><a href="#">Responsable de ressource humaine</a></li>
											<li><a href="#">Responsable de stock</a></li>
			                            </ul>
			                        </div>
											<br/>
							</div>
					
							<button id="submit"  value="Sauvegarder" type="button" class="btn col-xs-6 btn-success" 	ng-click="CreateUserModalCtrl.parent.saveUser(CreateUserModalCtrl.parent.user)"><span class="glyphicon glyphicon-saved"></span> Save</button> 
							 <button name="submit" id="submit"  value="Annuler" type="button" class="btn col-xs-6 btn-warning"  style="float:right;"><span class="glyphicon glyphicon-remove"></span>Cancel</button>

        			 </form>
  		      

