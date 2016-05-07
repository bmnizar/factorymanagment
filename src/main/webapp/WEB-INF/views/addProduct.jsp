<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">


<script src="scripts/jquery-1.12.1.js"></script>
<link href="http://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.5.4/bootstrap-select.css" rel="stylesheet" />
<link rel="stylesheet" href="scripts/bootstrap.css">
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

<script src="scripts/saveProductCtrl.js"></script>
<script src="scripts/user_service.js"></script>
<script src="scripts/user_controller.js"></script>




<link rel="stylesheet" href="css/style.css">




<title>Zollner |Service Commande</title>

<link rel="stylesheet" href="css/style.css">
</head>
<body ng-app="myApp">

		<div class="generic-container" ng-controller="SaveProductCtrl as ctrl">
		

		
	<nav class="navbar navbar navbar-static" style="background-color:#BBD2E1;" role="navigation" >
				<div class="container-fluid">
					<div style="max-height:30px" class="text-center navbar-header col-md-12">
						<li style="text-align:center;margin-top:10px;font-size:18pt;display:inline-block;"><span aria-hidden="true"></span>Service De Gestion de Commande</li>
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
								
									<li class="dropdown active">
										<a class="dropdown-toggle" data-toggle="dropdown" href="#">Gestion Commande
											<span class="caret"></span></a>
												
												<ul class="dropdown-menu" style="background-color:#BBD2E1";>
												
												  <li style="border-right:none"><a href="addProduct.jsp">AjouterCommande</a></li>
												  <li style="border-right:none"><a href="addProduct.jsp">AjouterProduit</a></li>
												  <li style="border-right:none"><a href="CommandeService.jsp">ConsulterCommande</a></li> 
											
												</ul>
													  
									</li>
									
									<li><a href="DocumentCommande.html">Gestion Des Documents</a>
									</li>
								</ul>
							</div>
								<ul class="nav navbar-nav navbar-right">
								
									<li><a href="PagePrincipale.html"><span class="glyphicon glyphicon-log-out"		></span>D�connexion</a>
									</li>
								</ul>
						</div>
				</div>
	</nav>
	

		<center><div id="azerty"></div></center>

				  <div class="col-md-5 col-md-6">
					<div class="panel panel-default">
					  <div class="panel-heading text-center"style="color:black;">
					   Ajouter  Produit
					  </div>
					 <div class="panel-body">
						<form name="myForm">
								<div class="row">
									<div class="col-md-12">

										<div class="form-group">
											<label for="refCommande" class="control-label">Reference Produit</label> 
											<input
												type="text"  ng-model="ctrl.product.refProduct"
												class="form-control" id="refCommande" placeholder="Reference Produit">
												
										</div>
									</div>

									<div class="col-md-12">
										

										<div class="form-group">
											<label for="refCommande" class="control-label">Nom du  Produit</label> <input
												type="text" ng-model="ctrl.product.nameProduct"
												class="form-control" id="refCommande" placeholder="Nom du Produit">
										</div>
									</div>
								</div>
					
							
						
						<div class="row">
									<div class="col-md-12">

										<div class="form-group">
											<label for="refCommande" class="control-label">Prix du  Produit</label> <input
												type="text" ng-model="ctrl.product.priceProduct"
												class="form-control" id="refCommande" placeholder="Prix du  Produit">
										</div>
									</div>

									<div class="col-md-12">
										

										<div class="form-group">
											<label for="refCommande" class="control-label"> Cat�gorie</label> <input
												type="text" ng-model="ctrl.product.category"
												class="form-control" id="refCommande" placeholder=" Cat�gorie">
										</div>
									</div>
						</div>
					
				
					
						<br>
						<br>
						<div class="modal-footer ">
							<button type="button" class="btn btn-primary btn-lg center-block" ng-click="ctrl.addProduct(ctrl.product)" style="width: 40%;"><span class="glyphicon glyphicon-ok-sign"></span>Ajouter</button>
						</div>
					</form>
					</div>
				</div>
			</div>
<!--//////////////////////////////////////Tableau /////////////////////////////////////////-->

 <div class="col-md-7 col-md-6">
 
 	<div class="panel panel-default">
							<div class="panel-heading  text-center" style="color:black;">
									List Des Produits 
								
							</div>
			<div class="panel-body">
				<div class="col-xs-12">

           <!----------------------------   Tableau------------------------------------------------------------------- -->
  				<table ng-table="tableParams"  id="ProductTable" class="table table-bordered" show-filter="true" > 
                         <tr>
								<thead>
									<tr>
									
										<th>Reference Produit</th>
										<th>Nom du  Produit</th>
										<th>Prix du  Produit</th>
										<th>Cat�gorie</th>
										
										<th>Modifier</th>
										<th>Supprimer</th>
									
									</tr>
								</thead>
	                    
		
						<tbody>
								<tr ng-repeat="p in $data">
							
									<td sortable="'refProduct'" ><span ng-bind="p.refProduct"></span></td>
									<td sortable="'nameProduct'"  ><span ng-bind="p.nameProduct"></span></td>
									<td sortable="'priceProduct"  ><span ng-bind="p.priceProduct"></span></td>
									<td sortable="'category'"  ><span ng-bind="p.category"></span></td>
									
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