<!DOCTYPE html>
<html lang="en">
<head>
  <title>Service de Commande</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
  <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
  
  <link rel="stylesheet" href="css/style.css">

   <title>Zollner |Service De Planification</title>
</head>
<body>
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
									<li class="active">
										<a href="CalculerDuréeFabrication.html"> Durée de fabrication</a>
									</li>
									<li>
										<a href="FicheProduit.html" > Fiche de production</a>
									</li>
									<li >
									<a href="#" >Planification</a>
									</li>
										<li>
											<a href="DocumentProduction.html">Gestion Document </a></li>
								</ul>
							
								<ul class="nav navbar-nav navbar-right">
									
									<li><a href="PagePrincipale.html"><span class="glyphicon glyphicon-log-out"></span>Déconnexion</a>
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
<br>
<br>
<br>

	<div class="container">
	
    <div class="col-lg-6 col-lg-offset-3">
 
    
				<div class="panel panel-info">
							<div class="panel-heading text-center" style="font-size:20px;color:black;">
								Caculer Durée de Fabrication						
							</div>
						<div class="panel-body style="min-height: 10; max-height: 10;">
							

           <form>
	
	<div class="form-group"> <!-- Name field -->
<label for="sel1">Produit (sélectionner  un produit ):</label>
      <select class="form-control" id="sel1">
                    <option>Produit 1</option>
					<option>Produit 2</option>
					<option>Produit 3</option>
					<option>Produit 4</option>
					<option>Produit 5</option>
				</select>

		
	</div>

	<div class="form-group"> <!-- Name field -->
		<label class="control-label " for="name">Quantité de Produit</label>
		<input class="form-control" id="ref" name="ref" type="text"/>
	</div>
		
<div class="form-group">
   <div class="input-group">
            <span class="input-group-btn">
                <button type="button" class="btn btn-success
">Calculer</button>
           
            </span>
            <input type="text" class="form-control"  placeholder="Resultat;">
        </div>

</div>
	
</form>								
 
    
			</div>			
						</div>
				</div>
  </div>
 

<script>
$(document).ready(function(){
    $("#myBtn").click(function(){
        $("#myModal").modal();
    });
});
</script>
<script>
$(document).ready(function(){
$("#mytable #checkall").click(function () {
        if ($("#mytable #checkall").is(':checked')) {
            $("#mytable input[type=checkbox]").each(function () {
                $(this).prop("checked", true);
            });

        } else {
            $("#mytable input[type=checkbox]").each(function () {
                $(this).prop("checked", false);
            });
        }
    });
    
    $("[data-toggle=tooltip]").tooltip();
});
</script>
</body>
</html>