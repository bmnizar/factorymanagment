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
<link
	href="http://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.5.4/bootstrap-select.css"
	rel="stylesheet" />
<link rel="stylesheet" href="scripts/bootstrap.css">
<script src="scripts/bootstrap.js"></script>
<script src="scripts/angular.js"></script>
<script src="scripts/ui-bootstrap-tpls-1.2.4.js"></script>
<script src="scripts/angular-animate.js"></script>
<script src="scripts/angular-aria.js"></script>
<script src="scripts/angular-messages.js"></script>

<script
	src="//ajax.googleapis.com/ajax/libs/angularjs/1.5.0/angular-route.js"></script>
<script
	src="http://ajax.googleapis.com/ajax/libs/angularjs/1.5.0/angular-resource.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.10.0/js/bootstrap-select.js"></script>
<script src="scripts/angular-cookies.js"></script>
<script src="https://rawgit.com/esvit/ng-table/master/dist/ng-table.js">
	
</script>
<script src="scripts/bootbox.js"></script>



<script src="scripts/app.js"></script>

<script src="scripts/app.js"></script>
<script src="scripts/user_service.js"></script>
<script src="scripts/ProductApp.js"></script>
<script src="scripts/ProductCtrl.js"></script>
<script src="scripts/ProductService.js"></script>
>




<link rel="stylesheet" href="css/style.css">




<title>Zollner |Service Commande</title>

<link rel="stylesheet" href="css/style.css">
</head>
<body ng-app="productApp">

	<div class="generic-container" ng-controller="ProductCtrl as ctrl">



		<nav class="navbar navbar navbar-static"
			style="background-color: #BBD2E1;" role="navigation">
		<div class="container-fluid">
			<div style="max-height: 30px"
				class="text-center navbar-header col-md-12">
				<li
					style="text-align: center; margin-top: 8px; font-size: 18pt; display: inline-block;"><span
					aria-hidden="true"></span>Service de Gestion de Production</li>
				<button type="button" class="navbar-toggle" data-toggle="collapse"
					data-target="#navbar" aria-expanded="false" aria-controls="navbar">
					<span class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
			</div>
			<br> <br> <img
				style="float: left; margin-left: -1%; margin-right: 0%;"
				src='images/images.png' width="50px" height="50px" />
			<div class="navbar-collapse collapse">

				<ul class="nav navbar-nav">
					<li><a href="PagePrincipaleResponsableProduction.html">Commande</span></a></li>
					<li><a href="CalculerDuréeFabrication.html"> Durée de
							fabrication</a></li>
					<li class="active"><a href="FicheProduit.html"> Fiche de
							production</a></li>
					<li><a href="#">Planification</a></li>
					<li><a href="DocumentProduction.html">Gestion Document </a></li>
				</ul>

				<ul class="nav navbar-nav navbar-right">

					<li><a href="PagePrincipale.html"><span
							class="glyphicon glyphicon-log-out"></span>Déconnexion</a></li>
				</ul>
			</div>
		</div>
		</nav>


		<center>
			<div id="azerty"></div>
		</center>

		<div class="col-md-5 col-md-6">
			<div class="panel panel-default">
				<div class="panel-heading text-center" style="color: black;">
					Ajouter Produit</div>
				<div class="panel-body">
					<form name="myForm">
						<div class="row">
							<div class="col-md-12">

								<div class="form-group">
									<label for="refCommande" class="control-label">Reference
										Produit</label> <input type="text" ng-model="ctrl.product.refProduct"
										class="form-control" id="refCommande"
										placeholder="Reference Produit">

								</div>
							</div>

							<div class="col-md-12">


								<div class="form-group">
									<label for="refCommande" class="control-label">Nom du
										Produit</label> <input type="text" ng-model="ctrl.product.nameProduct"
										class="form-control" id="refCommande"
										placeholder="Nom du Produit">
								</div>
							</div>
						</div>



						<div class="row">
							<div class="col-md-12">

								<div class="form-group">
									<label for="refCommande" class="control-label">Prix du
										Produit</label> <input type="text"
										ng-model="ctrl.product.priceProduct" class="form-control"
										id="refCommande" placeholder="Prix du  Produit">
								</div>
							</div>

							<div class="col-md-12">


								<div class="form-group">
									<label for="refCommande" class="control-label">
										Catégorie</label> <input type="text" ng-model="ctrl.product.category"
										class="form-control" id="refCommande" placeholder=" Catégorie">
								</div>
							</div>
							<div class="col-md-12">


								<div class="form-group">
									<label for="df" class="control-label"> Duree du
										Fabrication</label> <input type="text"
										ng-model="ctrl.product.productDuration" class="form-control"
										id="constructionTimeId" name="input" placeholder=" Catégorie">
								</div>
							</div>

						</div>



						<br> <br>
						<div class="modal-footer ">
							<button type="button" class="btn btn-primary btn-lg center-block"
								ng-click="ctrl.addProduct(ctrl.product)" style="width: 40%;">
								<span class="glyphicon glyphicon-ok-sign"></span>Ajouter
							</button>
						</div>
					</form>
				</div>
			</div>
		</div>



		<!--//////////////////////////////////////Edit Produit Modal/////////////////////////////////////////-->
		<div class="modal fade" id="updateProductModalId" role="dialog"
			aria-labelledby="ajoute" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal"
							aria-hidden="true">
							<span class="glyphicon glyphicon-remove" aria-hidden="true"></span>
						</button>
						<h4 class="modal-title custom_align"
							style="font-size: 25px; color: black;" id="Heading">
							<span class="glyphicon glyphicon-saved"></span> Modification
							Fabrique Produit
						</h4>
					</div>
					<div class="modal-body">
						<form role="form">
							<div class="form-group">
								<label for="rp" class="control-label">Reference Produit</label>
								<input type="text" ng-model="ctrl.selectedproduct.refProduct"
									class="form-control" id="refProduitId"
									placeholder="Reference Produit" name="input" required />

							</div>

							<div class="form-group">
								<label for="np" class="control-label">Nom du Produit</label> <input
									type="text" ng-model="ctrl.selectedproduct.nameProduct"
									class="form-control" id="nameProductId"
									placeholder="Nom du Produit" name="input" required />
							</div>
							<div class="form-group">
								<label for="prixproduct" class="control-label">Prix du
									Produit</label> <input type="text"
									ng-model="ctrl.selectedproduct.priceProduct"
									class="form-control" id="prixproductId"
									placeholder="Prix du  Produit">
							</div>
							<div class="form-group">
								<label for="catg" class="control-label"> Category</label> <input
									type="text" ng-model="ctrl.selectedproduct.category"
									class="form-control" id="categoryId" name="input"
									placeholder=" Catégorie">
							</div>


							<div class="form-group">
								<!-- Email field -->
								<label class="control-label " for="df">Durée de
									Fabrication (unité)<span class="asteriskField">*</span>
								</label> <input ng-model="ctrl.selectedproduct.productDuration"
									id="constructionTimeId" name="input" required />
							</div>
					</div>
					<div class="modal-footer ">
						<div class="form-group">

							<button id="submit" value="Sauvegarder" style="float: left;"
								type="button" class="btn col-md-6 btn-success"
								ng-click="ctrl.addProduct(ctrl.selectedproduct)"
								data-dismiss="modal">
								<span class="glyphicon glyphicon-ok-sign"></span> Enregistrer
							</button>
							<button name="closeSaveProductId" id="submit" value="Annuler"
								type="button" class="btn col-xs-5 btn-warning"
								style="float: center;" data-dismiss="modal">
								<span class="glyphicon glyphicon-remove"></span> Annuler
							</button>

						</div>

					</div>
					</form>
					<!-- /.modal-content -->
				</div>
				<!-- /.modal-dialog -->
			</div>



		</div>

		<!--//////////////////////////////////////Delete Product/////////////////////////////////////////-->

		<div class="modal fade" id="deleteProductConstructionModalId"
			role="dialog" aria-labelledby="delete" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal"
							aria-hidden="true">
							<span class="glyphicon glyphicon-remove" aria-hidden="true"></span>
						</button>
						<h4 class="modal-title custom_align" id="Heading">Supprimer
							le Produit</h4>
					</div>
					<div class="modal-body">

						<div class="alert alert-danger">
							<span class="glyphicon glyphicon-warning-sign"></span> Voulez
							vous supprimer cet produit
						</div>

					</div>
					<div class="modal-footer ">
						<button type="button" class="btn btn-success"
							id="confirmDeleteProductButton" data-dismiss="modal"
							ng-click="ctrl.deleteProduct()">
							<span class="glyphicon glyphicon-ok-sign"></span> Oui
						</button>
						<button type="button" class="btn btn-default"
							id="hideDeleteProductModalId" data-dismiss="modal">
							<span class="glyphicon glyphicon-remove"></span> Non
						</button>
					</div>
				</div>
				<!-- /.modal-content -->
			</div>
		</div>
		<!--//////////////////////////////////////Tableau /////////////////////////////////////////-->

		<div class="col-md-7 col-md-6">

			<div class="panel panel-default">
				<div class="panel-heading  text-center" style="color: black;">
					List Des Produits</div>
				<div class="panel-body">
					<div class="col-xs-12">

						<!----------------------------   Tableau------------------------------------------------------------------- -->

	<table ng-table="productConstructionTableTableParams" id="productConstructionTable" class="table table-bordered"
							show-filter="true">
						<!-- 	<tr>
							<thead>
								<tr>

									<th>Reference Produit</th>
									<th>Nom du Produit</th>
									<th>Prix du Produit</th>
									<th>Catégorie</th>
									<th>Duree du Fabrication</th>

									<th>Modifier</th>
									<th>Supprimer</th>

								</tr>
							</thead> -->


							<tbody>
								<tr ng-repeat="product in $data">

								<!-- 	<td sortable="'refProduct'"><span ng-bind="p.refProduct"></span></td>
									<td sortable="'nameProduct'"><span
										ng-bind="p.nameProduct"></span></td>
									<td sortable="'priceProduct"><span
										ng-bind="p.priceProduct"></span></td>
									<td sortable="'category'"><span ng-bind="p.category"></span></td>
									<td sortable="'productDuration'"><span
										ng-bind="p.productDuration"></span></td>

									<td>
										<button type="button" ng-click="ctrl.openEditUser(u)"
											class="btn btn-primary btn center-block">
											<span class="glyphicon glyphicon-pencil"></span>
										</button>
									</td>
									<td>
										<button type="button" ng-click="ctrl.openDeleteUser(u)"
											class="btn btn-danger btn center-block">
											<span class="glyphicon glyphicon-trash"></span>
										</button>
									</td> -->
				<td  data-title="'Reference de produit'" sortable="'refProduct'"  filter="{refProduct: 'text'}" ><span
										ng-bind="product.refProduct"></span></td>
				<td data-title="'Nom de produit'" filter="{nameProduct: 'text'}" sortable="'nameProduct'"><span
										ng-bind="product.nameProduct"></span></td>
				<td data-title="'Prix du produit'" filter="{priceProduct: 'text'}" sortable="'priceProduct'"><span
										ng-bind="product.priceProduct"></span></td>
				<td data-title="'Categorie'" filter="{category: 'text'}" sortable="'category'"><span
										ng-bind="product.category"></span></td>
				<td  data-title="'duree de fabrication'"  filter="{productDuration: 'text'}" sortable="'productDuration'"><span
										ng-bind="product.productDuration"></span></td>
										
				<td><p data-placement="top" data-toggle="tooltip"
											title="Edit">
											<button class="btn btn-primary btn center-block" "showUpdateProductModalId"
												ng-click="ctrl.triggerSelectedProduct(product)"
												data-title="Edit" data-toggle="modal" data-target="#updateProductModalId" >
												<span class="glyphicon glyphicon-pencil"></span>
											</button>
										</p></td>
									<td><p data-placement="top" data-toggle="tooltip"
											title="Delete">
											<button class="btn btn-danger btn center-block" id="showDeleteProductModalId" ng-click="ctrl.triggerSelectedProduct(product)"
												
												data-title="Delete" data-toggle="modal"
												data-target="#deleteProductModalId">
												<span class="glyphicon glyphicon-trash"></span>
											</button>
										</p></td>
								</tr>
							</tbody>
						</table>
					</div>
				</div>
			</div>

		</div>
		<script>
			$(document).ready(function() {
				$("#confirmDeleteProductButton").click(function() {
					$("#deleteProductModalId").modal('hide');
				});
			});
			$(document).ready(function() {
				$("#hideDeleteProductModalId").click(function() {
					$("#deleteProductModalId").modal('hide');
				});
			});
			$(document).ready(function() {
				$("#showUpdateProductModalId").click(function() {
					$("#updateProductModalId").modal('show');
				});
			});
			$(document).ready(function() {
				$("#showDeleteProductModalId").click(function() {
					$("#deleteProductModalId").modal('show');
				});
			});
		</script>
</body>
</html>