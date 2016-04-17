<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<head>
<!-- <link href="scripts/angular-material.css" rel="stylesheet" /> -->
</head>
<link rel="stylesheet" href="scripts/bootstrap.css">
<script src="scripts/jquery-1.12.1.js"></script>

<script src="scripts/bootstrap.js"></script>
<script src="scripts/angular.js"></script>
<script src="scripts/ui-bootstrap-tpls-1.2.4.js"></script>
<script src="scripts/angular-animate.js"></script>
<script src="scripts/angular-aria.js"></script>
<script src="scripts/angular-messages.js"></script>
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

		<table>
			<tr>
				<td><button type="button" class="btn btn-primary"
						ng-click="ctrl.openCreateUser()">Create</button></td>

			</tr>
		</table>




		<table class="table table-hover">
			<thead>
				<tr>
					<th>ID.</th>
					<th>Name</th>
					<th>Address</th>
					<th>Email</th>
					<th width="20%"></th>
				</tr>
			</thead>
			<tbody>
				<tr ng-repeat="u in ctrl.users">
					<td><span ng-bind="u.ssoId"></span></td>
					<td><span ng-bind="u.firstName"></span></td>
					<td><span ng-bind="u.lastName"></span></td>
					<td><span ng-bind="u.email"></span></td>
					<td>
						<button type="button" ng-click="ctrl.openEditUser(u)"
							class="btn btn-success custom-width">Edit</button>
						<button type="button" ng-click="ctrl.openDeleteUser(u)"
							class="btn btn-danger custom-width">Remove</button>
					</td>
				</tr>
			</tbody>
		</table>
	</div>

</body>
</html>