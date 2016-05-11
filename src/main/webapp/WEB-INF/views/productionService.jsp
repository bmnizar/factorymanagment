<html>

<head>
<!-- <link href="scripts/angular-material.css" rel="stylesheet" /> -->
<title>Service De Gestion de Commande</title>
<meta charset="utf-8">

<meta http-equiv="content-type" content="text/html; charset=UTF-8">
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
  <script src="http://cdnjs.cloudflare.com/ajax/libs/moment.js/2.10.6/moment.min.js"></script>
    <script src="http://cdnjs.cloudflare.com/ajax/libs/interact.js/1.2.4/interact.min.js"></script>
    <script src="http://ajax.googleapis.com/ajax/libs/angularjs/1.5.0/angular.js"></script>
    <script src="http://ajax.googleapis.com/ajax/libs/angularjs/1.5.0/angular-animate.js"></script>
    <script src="http://cdnjs.cloudflare.com/ajax/libs/angular-ui-bootstrap/0.14.3/ui-bootstrap-tpls.min.js"></script>
    <script src="http://mattlewis92.github.io/angular-bootstrap-calendar/dist/js/angular-bootstrap-calendar-tpls.min.js"></script>
   
<script src="scripts/angular-cookies.js"></script>
<script src="scripts/bootbox.js"></script>
<script src="scripts/SchedularCalendarApp.js"></script>
<script src="scripts/SchedularHelper.js"></script>


<script src="scripts/SchedularCalendarCtrl.js"></script>

<link rel="stylesheet" href="css/style.css">
    <link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" rel="stylesheet">
    <link href="http://mattlewis92.github.io/angular-bootstrap-calendar/dist/css/angular-bootstrap-calendar.min.css" rel="stylesheet">

<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.css">


<title>Zollner |Service Commande</title>


</head>
<body ng-app="SchedularCalendarApp">


	<div ng-controller="schedularCalendarCtrl as vm">

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
						<li><a href="C.html"> Duree de
								fabrication</a></li>
						<li><a href="FicheProduit.html"> Fiche de production</a></li>
						<li class="active"><a href="#">Planification</a></li>
						<li><a href="DocumentProduction.html">Gestion Document </a></li>
					</ul>

					<ul class="nav navbar-nav navbar-right">

						<li><a href="PagePrincipale.html"><span
								class="glyphicon glyphicon-log-out"></span>Dennexion</a></li>
					</ul>
				</div>
			</div>
		</nav>