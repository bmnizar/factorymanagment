<html>

<head>

  <title>Administrateur de systeme</title>
<meta charset="utf-8">
<meta http-equiv="content-type" content="text/html; charset=UTF-8">
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">

<script src="scripts/jquery-1.12.1.js"></script>
<link href="http://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.5.4/bootstrap-select.css" rel="stylesheet" />
<script src="scripts/bootstrap.css"></script>
<script src="scripts/bootstrap.js"></script>
<script src="scripts/angular.js"></script>
<script src="scripts/ui-bootstrap-tpls-1.2.4.js"></script>
<script src="scripts/angular-animate.js"></script>
<script src="scripts/angular-aria.js"></script>
<script src="scripts/angular-messages.js"></script>

<script src="//ajax.googleapis.com/ajax/libs/angularjs/1.5.0/angular-route.js"></script>
<script src="http://ajax.googleapis.com/ajax/libs/angularjs/1.5.0/angular-resource.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.10.0/js/bootstrap-select.js"></script>
<script src="scripts/angular-cookies.js"></script>
<script  src = "https://rawgit.com/esvit/ng-table/master/dist/ng-table.js" > </script >
<script src="scripts/bootbox.js"></script>



<script src="scripts/app.js"></script>
<script src="scripts/createUser.js"></script>
<script src="scripts/deleteUser.js"></script>
<script src="scripts/user_service.js"></script>
<script src="scripts/user_controller.js"></script>

<script src="scripts/CreateUserModalCtrl.js"></script>
<script src="scripts/DeleteUserModalCtrl.js"></script>




<title>Zollner |Service Administrative</title>
<link rel="stylesheet" href="css/style.css">

</head>
<body ng-app="myApp">

		<div class="generic-container" ng-controller="UserController as ctrl">
		<div id="createUserContent.jsp" ng-include="createUserContent"></div>
		<div id="editUserContent.jsp" ng-include="editUserContent"></div>
		<div id="deleteUserContent.jsp" ng-include="deleteUserContent"></div>
		
<nav class="navbar navbar navbar-static" style="background-color:#BBD2E1;" role="navigation" >
				<div class="container-fluid">
					<div style="max-height:30px" class="text-center navbar-header col-md-12">
						<li style="text-align:center;margin-top:10px;font-size:18pt;display:inline-block;"><span aria-hidden="true"></span>Administrateur De Systeme</li>
							<button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
								<span class="icon-bar"></span>
								<span class="icon-bar"></span>
								<span class="icon-bar"></span>
							</button>
					</div>
						<img style="float:left; margin-left:-1%;margin-right:1%; " src='images/images.png' width="50px" height="50px"/>
						<div class="navbar-collapse collapse" id="navbar-main" >
							<div class="col-md-6">
								<ul class="nav navbar-nav">
									<li class="active"><a href="#">Gestion Utulisateur</span></a>
									</li>
								</ul>
							</div>
								<ul class="nav navbar-nav navbar-right">
									<li><a href="#" data-toggle="modal" data-target="#loginModal"><span	class="glyphicon glyphicon-cog"></span> Parametre</a>
									</li>
									<li><a href="#"><span class="glyphicon glyphicon-log-out"></span>Deconnexion</a>
									</li>
								</ul>
						</div>
				</div>
	</nav>
	<div class="container">
		<div class="panel panel-success">
							<div class="panel-heading  text-center" style="font-size:25px;font-family:Impact;color:black;">
									List Utilisateur 
									<a class=" btn btn-primary" ng-click="ctrl.openCreateUser()" style="float:right;"><span class="glyphicon glyphicon-plus"></span>&nbsp;&nbsp;Ajouter Utilisateur</a>
							</div>
			<div class="panel-body">
				<div class="col-xs-12">

           <!--  --------------------------   Tableau------------------------------------------------------------------- -->
  				<table ng-table="tableParams"  id="myTable" class="table table-bordered" show-filter="true" > 
                         <tr>
								<thead>
									<tr>
										<th>ID</th>
										<th>Nom</th>
										<th>Prenom</th>
										<th>Mot de passe</th>
										<th>Email</th>
										<th>Telephone</th>
										<th>Role</th>
										<th>Modifier</th>
										<th>Supprimer</th>
									
									</tr>
								</thead>
	                    
		
						<tbody>
								<tr ng-repeat="u in $data">
									<td data-title="'id'" sortable="'id'" ><span ng-bind="u.id"></span></td>
									<td sortable="'firstName'" ><span ng-bind="u.firstName"></span></td>
									<td sortable="'lastName'"  ><span ng-bind="u.lastName"></span></td>
									<td sortable="'password'"  ><span ng-bind="u.password"></span></td>
									<td sortable="'email'"  ><span ng-bind="u.email"></span></td>
									<td sortable="'phoneNumber'" ><span ng-bind="u.phoneNumber"></span></td>
									<td sortable="'role'" ><span ng-bind="u.role"></span></td>
									<td>
										<button type="button" ng-click="ctrl.openEditUser(u)"
											class="btn btn-primary btn center-block"><span class="glyphicon glyphicon-pencil"></span></button>
									</td>
									<td>
										<button type="button" ng-click="ctrl.openDeleteUser(u)"
											class="btn btn-danger btn center-block"><span class="glyphicon glyphicon-trash"></span></button>
									</td>
								</tr>
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</div>

</body>
</html>