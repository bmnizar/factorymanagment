<!DOCTYPE html>
<html lang="en">
<head>
  <title>Service de Commande</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.js"></script>
  <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.js"></script>
     <link rel="stylesheet" href="http://cdn.datatables.net/1.10.2/css/jquery.dataTables.css"></style>
<script type="text/javascript" src="http://cdn.datatables.net/1.10.2/js/jquery.dataTables.js"></script>
 


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

<script src="scripts/ProductConstructionApp.js"></script>
<script src="scripts/ProductConstructionCtrl.js"></script>
<script src="scripts/ProductConstructionService.js"></script>

  <link rel="stylesheet" href="css/style.css">
   <title>Zollner |Service De Planification</title>
</head>
<body ng-app="productConstructionApp">
<div class="generic-container" ng-controller="ProductConstructionCtrl as ctrl">
<!-- Debut de la barre menu -->

	<nav class="navbar navbar navbar-static" style="background-color:#BBD2E1;" role="navigation" >
				<div class="container-fluid">
					<div style="max-height:30px" class="text-center navbar-header col-md-12">
						<li style="text-align:center;margin-top:8px;font-size:18pt;display:inline-block;"><span aria-hidden="true"></span>Service de  Gestion de Production</li>
							<button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
								<span class="icon-bar"></span>
								<span class="icon-bar"></span>
								<span class="icon-bar"></span>
							</button>
					</div>
					<br><br>
						<img style="float:left; margin-left:-1%;margin-right:0%; " src='images/images.png' width="50px" height="50px"/>
						<div class="navbar-collapse collapse" >
						
							<ul class="nav navbar-nav">
									<li><a href="PagePrincipaleResponsableProduction.html">Commande</span></a></li>
									<li>
										<a href="CalculerDur�eFabrication.html"> Dur�e de fabrication</a>
									</li>
									<li class="active">
										<a href="FicheProduit.html" > Fiche de production</a>
									</li>
									<li >
									<a href="#" >Planification</a>
									</li>
										<li>
											<a href="DocumentProduction.html">Gestion Document </a></li>
								</ul>
							
								<ul class="nav navbar-nav navbar-right">
									
									<li><a href="PagePrincipale.html"><span class="glyphicon glyphicon-log-out"></span>D�connexion</a>
									</li>
								</ul>
						</div>
				</div>
	</nav>


			 <div class="container">

		<div id="loginModal" class="modal fade" role="dialog">

			<div class="modal-dialog modal-vertical-centered modal-md-8">

				<div class="modal-content bg-default">


					<div class="text-center modal-header" style="padding: 2px 10px";">
						<button type="button" class="close" data-dismiss="modal">&times;</button>
						<h4>
							<span class="glyphicon glyphicon-lock"></span> Modification Mot de passe
						</h4>

					</div>
				

						<div class="modal-body bg-default">

							<form class="form-horizontal" role="form">
								
									
									<div class="form-group">
										<label class="control-label col-sm-4" for="nom">Mot de Passe Actuel&nbsp; &nbsp;</label>
										<div class="col-sm-6">
											<input type="nom" class="form-control" id="nom"
												placeholder="Mot de Passe Actuel">
										</div>
									</div>
									<br>

									<div class="form-group">
										<label class="control-label col-sm-4" for="pwd"> Nouveau Mot de passe</label>
										<div class="col-sm-6">
											<input type="password" class="form-control" id="pwd"
												placeholder="Nouveau Mot de passe">
										</div>
									</div>

									<br> <br>

									<div class="form-group">
										<div class="col-sm-offset-2 col-sm-8">
											<button type="submit"
												class="btn btn-primary   form-group col-sm-8">
												<span class="glyphicon glyphicon-ok"></span>&nbsp;Enregistrer Modification
											</button>
											<button type="submit"
												class="btn btn-warning  form-group col-sm-5"
												style="float: right;">
												<span class="glyphicon glyphicon-remove"></span>&nbsp;Annuler
											</button>
										</div>
									</div>
								
							</form>
						</div>
					
				</div>

			</div>
		</div>
	</div>
<div class="col-md-8">
		
	<div class="modal fade" id="createProductConstructionModalId"  role="dialog" aria-labelledby="ajoute" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				  <div class="modal-header">
						<button type="button" class="close" data-dismiss="modal" aria-hidden="true"><span class="glyphicon glyphicon-remove" aria-hidden="true"></span></button>
						<h4 class="modal-title custom_align" style="font-size:25px;color:black;" id="Heading"><span class="glyphicon glyphicon-saved" ></span> Ajouter Produit</h4>
					</div>
					<div class="modal-body">
						<form role="form">
								<div class="form-group"> <!-- Name field -->
									<label class="control-label " for="name">Nom de Produit</label>
									<input ng-model="ctrl.productConstruction.product.nameProduct" class="form-control" id="ref" name="ref" type="text"/>
								</div>

								<div class="form-group"> <!-- Name field -->
									<label class="control-label " for="name">R�ference Produit</label>
									<input ng-model="ctrl.productConstruction.product.refProduct" class="form-control" id="ref" name="ref" type="text"/>
								</div>
	
								<div class="form-group"> <!-- Email field -->
									<label class="control-label " for="df">Dur�e de Fabrication (unit�)<span class="asteriskField">*</span></label>
								<input ng-model="ctrl.productConstruction.productDuration"  type="time" id="constructionTimeId" name="input"
									ng-model="sample.value" placeholder="HH:mm:ss" min="06:00:00"
									max="24:00:00" required />
								</div>
					</div>
						<div class="modal-footer ">
						<div class="form-group">

							<button id="submit" value="Sauvegarder" style="float: left;" 
								type="button" class="btn col-md-6 btn-success" ng-click="ctrl.addProductConstruction(productConstruction)" 
								data-dismiss="modal">
								<span class="glyphicon glyphicon-ok-sign"></span>�Enregistrer
							</button>
							<button name="submit" id="submit" value="Annuler" type="button" ng-click="ctrl.cancelProductConstruction()" 
								class="btn col-xs-5 btn-warning" style="float: center;"
								data-dismiss="modal">
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
</div>
    
      <div class="container">


				<div class="panel panel-success">
					<div class="panel-heading text-center" style="color:black;">
							Liste des Produits 
							<a class=" btn btn-primary" id="showAddProductConstructionModalId" style="float:right;"><span class="glyphicon glyphicon-plus" ng-click="ctrl.openCreateUser()" ></span>&nbsp;&nbsp;Ajouter</a>
					</div>
					<div class="panel-body">
						<div class="col-xs-12">

           
<table ng-table="productConstructionTableTableParams"  id="productConstructionTable" class="table table-bordered" show-filter="true" > 
              
						<thead>
							<tr>
								<th>Nom de produit</th>
								<th>R�ference de produit</th>
								<th>Dur�e de Fabrication</th>
								<th>Modifier</th>
								<th>Supprimer</th>
							</tr>
						</thead>
						<tbody>
								<tr ng-repeat="productConstruction in $data">
									<td data-title="'id'" sortable="'id'" ><span ng-bind="productConstruction.id"></span></td>
									<td sortable="'refProduct'" ><span ng-bind="productConstruction.product.refProduct"></span></td>
									<td sortable="'nameProduct'"  ><span ng-bind="productConstruction.product.nameProduct"></span></td>
									<td sortable="'productDuration'"  ><span ng-bind="productConstruction.productDuration"></span></td>

								<td><p data-placement="top" data-toggle="tooltip"
										title="Edit">
										<button class="btn btn-primary btn center-block" ng-click="ctrl.openEditProductConstruction(productConstruction)"
											data-title="Edit" data-toggle="modal" data-target="#edit">
											<span class="glyphicon glyphicon-pencil"></span>
										</button>
									</p></td>
								<td><p data-placement="top" data-toggle="tooltip"
										title="Delete">
										<button class="btn btn-danger btn center-block" ng-click="ctrl.openDeleteProductConstruction(productConstruction)"
											data-title="Delete" data-toggle="modal" data-target="#delete">
											<span class="glyphicon glyphicon-trash"></span>
										</button>
									</p></td>
								</tr>
						</tbody>

					</table>
  <div class="modal fade" id="edit" tabindex="-1" role="dialog" aria-labelledby="edit" aria-hidden="true">
      <div class="modal-dialog">
    <div class="modal-content">
          <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-hidden="true"><span class="glyphicon glyphicon-remove" aria-hidden="true"></span></button>
        <h4 class="modal-title custom_align" id="Heading">Modification</h4>
      </div>
          <div class="modal-body">
					<div class="form-group">
						<label for="NumCommande">Nom de produit</label> 
						<input class="form-control " type="text" placeholder="produit XY">
					</div>
					<div class="form-group">
						<label for="typeproduit">R�ference de produit </label> 
        
						<input class="form-control " type="text" placeholder="z8zaz2">
					</div>
					<div class="form-group">
						<label for="quantiteproduit">Dur�e de fabrication</label> 
						<input class="form-control " type="text" placeholder="15 minute">
					</div>
					
      </div>
          <div class="modal-footer ">
        <button type="button" class="btn btn-warning btn-lg" style="width: 100%;"><span class="glyphicon glyphicon-ok-sign"></span>Modifier</button>
      </div>
        </div>
    <!-- /.modal-content --> 
  </div>
      <!-- /.modal-dialog --> 
    </div>
    
    
    
    <div class="modal fade" id="delete" tabindex="-1" role="dialog" aria-labelledby="edit" aria-hidden="true">
      <div class="modal-dialog">
    <div class="modal-content">
          <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-hidden="true"><span class="glyphicon glyphicon-remove" aria-hidden="true"></span></button>
        <h4 class="modal-title custom_align" id="Heading">Supprimer Produit</h4>
      </div>
          <div class="modal-body">
       
       <div class="alert alert-danger"><span class="glyphicon glyphicon-warning-sign"></span> Voulez vous supprimer ce produit</div>
       
      </div>
        <div class="modal-footer ">
        <button type="button" class="btn btn-success" ><span class="glyphicon glyphicon-ok-sign"></span>�Oui</button>
        <button type="button" class="btn btn-default" data-dismiss="modal"><span class="glyphicon glyphicon-remove"></span>�Non</button>
      </div>
        </div>
    <!-- /.modal-content --> 
  </div>
						</div>
					</div>
  </div>
  </div>
  </div>
</div>
  	<script>
		$(document).ready(function() {
			$("#showAddProductConstructionModalId").click(function() {
				$("#createProductConstructionModalId").modal('show');
			});
		});
	</script>
</div>
</body>
</html>
	 