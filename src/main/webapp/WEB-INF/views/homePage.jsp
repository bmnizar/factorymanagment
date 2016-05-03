<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
 pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>

<head>
<!-- <link href="scripts/angular-material.css" rel="stylesheet" /> -->
  <title>Administrateur de syst?</title>
<meta charset="utf-8">
<meta http-equiv="content-type" content="text/html; charset=UTF-8">
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" 
    integrity="sha384-1q8mTJOASx8j1Au+a5WDVnPi2lkFfwwEAa8hDDdjZlpLegxhjVME1fgjWPGmkzs7" crossorigin="anonymous">
 <link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css" rel="stylesheet">
  <!-- Optional theme -->
<link href="http://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.5.4/bootstrap-select.min.css" rel="stylesheet" />
<link rel="stylesheet" href="scripts/bootstrap.css">
<!-- Datatable script -->
    
         <link  rel = "stylesheet"  href = "https://rawgit.com/esvit/ng-table/master/dist/ng-table.css" > 
   
         <link  href = "app/resources/css/style.css"  rel = "stylesheet"  type = "text/css" /> 
        <
   <!-- Latest compiled and minified JavaScript -->
<script src="scripts/jquery-1.12.1.js"></script>
<script src="scripts/bootstrap.css"></script>
<script src="scripts/bootstrap.js"></script>
<script src="scripts/angular.js"></script>
<script src="scripts/ui-bootstrap-tpls-1.2.4.js"></script>
<script src="scripts/angular-animate.js"></script>
<script src="scripts/angular-aria.js"></script>
<script src="scripts/angular-messages.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.10.0/js/bootstrap-select.js"></script>
<script src="scripts/angular-cookies.js"></script>
<script src="scripts/bootbox.js"></script>
     <script  src = "https://rawgit.com/esvit/ng-table/master/dist/ng-table.js" > </script >
<script src="scripts/app.js"></script>
<script src="scripts/createUser.js"></script>
<script src="scripts/deleteUser.js"></script>
<script src="scripts/user_service.js"></script>
<script src="scripts/user_controller.js"></script>
<!--<script src="scripts/dataTable.js"></script>-->
<script src="scripts/CreateUserModalCtrl.js"></script>
<script src="scripts/DeleteUserModalCtrl.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js" integrity="sha384-0mSbJDEHialfmuBBQP6A4Qrprq5OVfW37PRR3j5ELqxss1yVqOtnepnHVP9aJ7xS" crossorigin="anonymous"></script>
<link  rel = "stylesheet"  href = "https://rawgit.com/esvit/ng-table/master/dist/ng-table.css" > 
     <script  src = "https://rawgit.com/esvit/ng-table/master/dist/ng-table.js" > </script >
<title>Zollner |Service Administrative</title>
<link rel="stylesheet" href="css/style.css">
<link rel="stylesheet" href="https://cdn.rawgit.com/esvit/ng-table/v1.0.0/dist/ng-table.min.css">
<script src="https://cdn.rawgit.com/esvit/ng-table/v1.0.0/dist/ng-table.js"></script>

</head>
<body ng-app="myApp">

  <div class="generic-container" ng-controller="UserController as ctrl">
  <div id="createUserContent.jsp" ng-include="createUserContent"></div>
  <div id="editUserContent.jsp" ng-include="editUserContent"></div>
  <div id="deleteUserContent.jsp" ng-include="deleteUserContent"></div>
  
<nav class="navbar navbar navbar-static" style="background-color:#BBD2E1;" role="navigation" >
    <div class="container-fluid">
     <div style="max-height:30px" class="text-center navbar-header col-md-12">
      <li style="text-align:center;margin-top:10px;font-size:18pt;display:inline-block;"><span aria-hidden="true"></span>Administrateur De Syst�me</li>
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
         <li><a href="#" data-toggle="modal" data-target="#loginModal"><span class="glyphicon glyphicon-cog"></span> Parametre</a>
         </li>
         <li><a href="#"><span class="glyphicon glyphicon-log-out"></span>Deconexion</a>
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
      <table ng table = "usersTable"  id="myTable" class="table table-bordered table-striped"  > 
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
                     
								<tr ng-repeat="u in ctrl.users">
									<td><span ng-bind="u.id"></span></td>
									<td   sortable="'firstName'"><span ng-bind="u.firstName"></span></td>
									<td><span ng-bind="u.lastName"></span></td>
									<td><span ng-bind="u.password"></span></td>
									<td><span ng-bind="u.email"></span></td>
									<td><span ng-bind="u.phoneNumber"></span></td>
									<td><span ng-bind="u.role"></span></td>
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