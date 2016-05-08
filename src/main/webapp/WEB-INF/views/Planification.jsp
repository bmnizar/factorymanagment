<html>

<head>
<!-- <link href="scripts/angular-material.css" rel="stylesheet" /> -->
<title>Service De Gestion de Commande</title>
<meta charset="utf-8">
<meta http-equiv="content-type" content="text/html; charset=UTF-8">
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- Style CSS Bootstrap -->
  <link rel="stylesheet" href="http://angular-ui.github.io/ui-calendar/bower_components/bootstrap-css/css/bootstrap.css" />
    <link rel="stylesheet" href="http://angular-ui.github.io/ui-calendar/bower_components/fullcalendar/dist/fullcalendar.css">
   
   
   <script src="http://angular-ui.github.io/ui-calendar/bower_components/jquery/dist/jquery.js"></script>
<script src="http://angular-ui.github.io/ui-calendar/bower_components/angular/angular.js"></script>
<script src="http://angular-ui.github.io/bootstrap/ui-bootstrap-tpls-0.9.0.js"></script>
<script src="http://angular-ui.github.io/ui-calendar/bower_components/moment/moment.js"></script>
    <script src="http://angular-ui.github.io/ui-calendar/bower_components/fullcalendar/dist/fullcalendar.js"></script>
    <script src="http://angular-ui.github.io/ui-calendar/bower_components/fullcalendar/dist/gcal.js"></script>
	<script src="http://angular-ui.github.io/ui-calendar/src/calendar.js"></script>


	<script src="scripts/angular-animate.js"></script>
<script src="scripts/angular-aria.js"></script>
<script src="scripts/angular-messages.js"></script>

<script src="//ajax.googleapis.com/ajax/libs/angularjs/1.5.0/angular-route.js"></script>
<script src="http://ajax.googleapis.com/ajax/libs/angularjs/1.5.0/angular-resource.js"></script>
<script src="scripts/angular-cookies.js"></script>
<script  src = "https://rawgit.com/esvit/ng-table/master/dist/ng-table.js" > </script >
<script src="scripts/bootbox.js"></script>


   <script src="scripts/SchedularCalendarApp.js"></script>
     <script src="scripts/SchedularCalendarCtrl.js"></script>

<link rel="stylesheet" href="css/style.css">




<title>Zollner |Service Commande</title>

<link rel="stylesheet" href="css/style.css">
</head>
<body ng-app="SchedularCalendarApp">


<div ng-controller="schedularCalendarCtrl">

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
				<br>
				<br> <img
					style="float: left; margin-left: -1%; margin-right: 0%;"
					src='images/images.png' width="50px" height="50px" />
				<div class="navbar-collapse collapse">

					<ul class="nav navbar-nav">
						<li><a href="PagePrincipaleResponsableProduction.html">Commande</span></a></li>
						<li><a href="CalculerDuréeFabrication.html"> Durée de
								fabrication</a></li>
						<li><a href="FicheProduit.html"> Fiche de production</a></li>
						<li class="active"><a href="#">Planification</a></li>
						<li><a href="DocumentProduction.html">Gestion Document </a></li>
					</ul>

					<ul class="nav navbar-nav navbar-right">

						<li><a href="PagePrincipale.html"><span
								class="glyphicon glyphicon-log-out"></span>Déconnexion</a></li>
					</ul>
				</div>
			</div>
		</nav>
		<div>



			<!--------------------------------------------------------------Calendar------------------------------------------------------------->
		<div ui-calendar="uiConfig.calendar" class="span8 calendar" 
			ng-model="eventSources"></div> 
			

</div>
		</div>
		
</body>
</html>