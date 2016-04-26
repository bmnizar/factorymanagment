<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>

<head>
<!-- <link href="scripts/angular-material.css" rel="stylesheet" /> -->
  <title>Administrateur de système</title>
    <meta charset="utf-8">

  <link rel="stylesheet" href="css/style.css">
   <title>Zollner |Service Administrative</title>

<link rel="stylesheet" href="scripts/bootstrap.css">
<script src="scripts/jquery-1.12.1.js"></script>
<script src="scripts/bootstrap.css"></script>
<script src="scripts/bootstrap.js"></script>
<script src="scripts/angular.js"></script>
<script src="scripts/ui-bootstrap-tpls-1.2.4.js"></script>
<script src="scripts/angular-animate.js"></script>
<script src="scripts/angular-aria.js"></script>
<script src="scripts/angular-messages.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.10.0/js/bootstrap-select.js"></script>
<!-- <script src="scripts/angular-material.js"></script> -->
<script src="scripts/angular-cookies.js"></script>
<script src="scripts/bootbox.js"></script>
<script src="scripts/app.js"></script>
<script src="scripts/createUser.js"></script>
<script src="scripts/user_service.js"></script>
<script src="scripts/user_controller.js"></script>
<script src="scripts/CreateUserModalCtrl.js"></script>

</head>
<body ng-app="myApp">

		<div class="generic-container" ng-controller="UserController as ctrl">
		<div id="createUserContent.jsp" ng-include="createUserContent"></div>
		<div id="editUserContent.jsp" ng-include="editUserContent"></div>
		<div id="deleteUserContent.jsp" ng-include="deleteUserContent"></div>
		
<nav class="navbar navbar navbar-static" style="background-color:#BBD2E1;" role="navigation" >
				<div class="container-fluid">
					<div style="max-height:30px" class="text-center navbar-header col-md-12">
						<li style="text-align:center;margin-top:10px;font-size:18pt;display:inline-block;"><span aria-hidden="true"></span>Administrateur De Systéme</li>
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
									<li><a href="#" data-toggle="modal" data-target="#loginModal"><span	class="glyphicon glyphicon-cog"></span> Paramétre</a>
									</li>
									<li><a href="#"><span class="glyphicon glyphicon-log-out"		></span>Déconnexion</a>
									</li>
								</ul>
						</div>
				</div>
	</nav>
	<div class="container">
		<div class="panel panel-success">
							<div class="panel-heading  text-center" style="font-size:20px;color:black;">
									List User 
									<a class=" btn btn-primary" ng-click="ctrl.openCreateUser($event)" style="float:right;"><span class="glyphicon glyphicon-plus"></span>&nbsp;&nbsp;Add User</a>
							</div>
			<div class="panel-body">
				<div class="col-xs-12">

           <!--  --------------------------   Tableau------------------------------------------------------------------- -->
  					<table  class="table table-hover" > 
                         <tr>
								<thead>
									<tr>
										<th>ID</th>
										<th>firstName</th>
										<th>lastName</th>
										<th>Password</th>
										<th>Email</th>
										<th>PhoneNumber</th>
										<th>Role</th>
										<th width="20%"></th>
									</tr>
								</thead>
	                    
		
						<tbody>
								<tr ng-repeat="u in ctrl.users">
									<td><span ng-bind="u.ssoId"></span></td>
									<td><span ng-bind="u.firstName"></span></td>
									<td><span ng-bind="u.lastName"></span></td>
									<td><span ng-bind="u.password"></span></td>
									<td><span ng-bind="u.email"></span></td>
									<td><span ng-bind="u.phoneNumber"></span></td>
									<td><span ng-bind="u.role"></span></td>
									<td>
										<button type="button" ng-click="ctrl.openEditUser(u)"
											class="btn btn-success custom-width">Edit</button>
									</td>
									<td>
										<button type="button" ng-click="ctrl.openDeleteUser(u)"
											class="btn btn-danger custom-width">Remove</button>
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