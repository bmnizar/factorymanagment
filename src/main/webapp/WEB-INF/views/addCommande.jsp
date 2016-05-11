<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<!-- <link href="scripts/angular-material.css" rel="stylesheet" /> -->
  <title>Service De Gestion de Commande</title>
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
   <!-- Latest compiled and minified JavaScript -->

  <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
  <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>

<link rel="stylesheet" href="css/style.css">




<title>Zollner |Service Commande</title>
	
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
												
												  <li style="border-right:none"><a href="AjouterCommande.html">AjouterCommande</a></li>
												 
												  <li style="border-right:none"><a href="PagePrincipaleResponsableCommande.html">ConsulterCommande</a></li> 
											
												</ul>
													  
									</li>
									
									<li><a href="DocumentCommande.html">Gestion Des Documents</a>
									</li>
								</ul>
							</div>
								<ul class="nav navbar-nav navbar-right">
								
									<li><a href="PagePrincipale.html"><span class="glyphicon glyphicon-log-out"		></span>Déconnexion</a>
									</li>
								</ul>
						</div>
				</div>
	</nav>
	

		<center><div id="azerty"></div></center>

				  <div class="col-md-offset-2 col-md-8">
					<div class="panel panel-default">
					  <div class="panel-heading text-center" style="font-size:20px;color:black; font-family:Impact, Charcoal, sans-serif;">
					   Ajouter  Commande
					  </div>
					 <div class="panel-body">
					 	<div class="row">
							<div class="col-md-6">

								<div class="form-group">
									<label for="refCommande" class="control-label">Reference Commande</label> <input
										type="text" ng-model=""
										class="form-control" id="refCommande" placeholder="Reference Commande">
								</div>
							</div>

							<div class="col-md-6">
								<div class="form-group">
										<label for="field-7" class="control-label">Type de commande</label>
									<div class="form-group">
											<select class="selectpicker form-control"
												title="Choose one of the following..." data-width="auto">
												<option>Normal</option>
												<option>Urgent</option>

											</select>
									</div>
								</div>
							</div>
					
							
						</div>
						<div class="row">
							<div class="col-md-6">

								<div class="form-group">
									<label for="dtl" class="control-label">Date de livraison</label> <input
										type="date" ng-model=""
										class="form-control" id="dtr" placeholder="Date de livraison">
								</div>
							</div>
								<div class="col-md-6">
									<div class="form-group">
										<label for="dtr" class="control-label">Date de réception</label> <input type="date" ng-model=""
										class="form-control" id="dtr" placeholder="Date de réception">
									</div>
								</div>
							
						</div>
					
						
							<form id="produitForm" method="post">
								<div class="row">
										<div class="col-md-4">
											<div class="form-group">
													<label for="field-7" class="control-label">Nom Produit</label>
												<div class="form-group">
														<select class="selectpicker form-control"
															title="Choose one of the following..." data-width="auto">
															<option>Produit1</option>
															<option>Produit2</option>

														</select>
												</div>
											</div>
										</div>
										<div class="col-md-4">

											<div class="form-group">
												<label for="qteProduit" class="control-label">Quantité Produit</label> 
												<input
													type="text" ng-model=""
													class="form-control" name="produit[0].nomProduit id="qteProduit" placeholder="Quantité de produit">

											</div>
										</div>
											
											
													<div class="col-md-4">
														<div class="form-group">
															<br>
															<button type="button"  class="btn btn-info form-group">Ajouter Produit</button>
														</div>
													</div>
								</div>
										
									<div class="row">
												<div class="form-group hide" id="produitTemplate">
													<div class="col-md-4">
														<div class="form-group">
																<label for="field-7" class="control-label">Nom Produit</label>
															<div class="form-group">
																	<select class="selectpicker form-control"
																		title="Choose one of the following..." data-width="auto">
																		<option>Produit1</option>
																		<option>Produit2</option>

																	</select>
															</div>
														</div>
													</div>
													<div class="col-md-4">

														<div class="form-group">
															<label for="refProduit" class="control-label">Quantité Produit</label> 
															<input
																type="text" ng-model=""
																class="form-control" id="qteProduit" placeholder="Quantité Produit">

														</div>
													</div>
											</div>
									</div>
							</form>
						</div>
						<br>
						<br>
						<div class="modal-footer ">
							<button type="button" class="btn btn-primary btn-lg center-block" style="width: 70%;"><span class="glyphicon glyphicon-ok-sign"></span>Ajouter</button>
						</div>
					</div>
				</div>
			</div>
		</div>



</body>
</html>