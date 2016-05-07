<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html lang="en">
<head>
  <title>Service de Commande</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
  <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
   <link rel="stylesheet" href="http://cdn.datatables.net/1.10.2/css/jquery.dataTables.min.css"></style>
<script type="text/javascript" src="http://cdn.datatables.net/1.10.2/js/jquery.dataTables.min.js"></script>
  
  <link rel="stylesheet" href="css/style.css">
   <title>Zollner |Service De commande</title>
</head>
<body>
<!-- Debut de la barre menu -->
	
        
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
												
												  <li style="border-right:none"><a href="AjouterCommande">AjouteCommande</a></li>
												  <li style="border-right:none"><a href="addProduct">AjouteProduit</a></li>
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

</body>
</html>
