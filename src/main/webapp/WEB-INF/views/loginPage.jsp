<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<!-- General Metas -->
<meta http-equiv="content-type" content="text/html; charset=UTF-8">
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css"
	integrity="sha384-1q8mTJOASx8j1Au+a5WDVnPi2lkFfwwEAa8hDDdjZlpLegxhjVME1fgjWPGmkzs7"
	crossorigin="anonymous">
<link
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css"
	rel="stylesheet">

<!-- Optional theme -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap-theme.min.css"
	integrity="sha384-fLW2N01lMqjakBkx3l/M9EahuwpSfeNvV63J5ezn3uZzapT0u7EYsXMjQV+0En5r"
	crossorigin="anonymous">

<!-- Latest compiled and minified JavaScript -->
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"
	integrity="sha384-0mSbJDEHialfmuBBQP6A4Qrprq5OVfW37PRR3j5ELqxss1yVqOtnepnHVP9aJ7xS"
	crossorigin="anonymous"></script>
<!-- Mobile Specific Metas -->
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1" />
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>

<script src="js/bootstrap.min.js"></script>
<script
	src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
<script src="css/acceuil.css"></script>
 <!-- Stylesheets -->
<!-- <link rel="stylesheet" href="css/acceuil.css">  -->
<title>Zollner | Accueil</title>
</head>
<body onload='document.loginForm.username.focus();'>

<c:if test="${not empty error}">
		<div>${error}</div>
	</c:if>
	<c:if test="${not empty message}">
		<div>${message}</div>
	</c:if>

	<nav class="navbar navbar navbar-static"
		style="background-color: #BBD2E1;" role="navigation">
		<div class="container-fluid">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle" data-toggle="collapse"
					data-target="#navbar" aria-expanded="false" aria-controls="navbar">

					<span class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="#">Logo</a>

			</div>
			<div id="navbar" class="navbar-collapse collapse">
				<ul class="nav navbar-nav">
					<li class="active"><a href="#"><span
							class="glyphicon glyphicon-home" aria-hidden="true"></span> Home</a></li>
					<li><a href="#"> <span
							class="glyphicon glyphicon-info-sign" aria-hidden="true"></span>
							About
					</a></li>

					<li><a href="#"><span class="fa fa-envelope-o"></span>
							Contact</a></li>
				</ul>
				<ul class="nav navbar-nav navbar-right">
					<li><a href="#" data-toggle="modal" data-target="#loginModal"><span
							class="glyphicon glyphicon-log-in"></span> login</a></li>
				</ul>
			</div>
		</div>
	</nav>


	<div class="container">
		<div id="loginbox" style="margin-top: 50px;"
			class="mainbox col-md-6 col-md-offset-3 col-sm-8 col-sm-offset-2">
			<div class="panel panel-info">
				<div class="panel-heading">
					<div class="panel-title text-center">
						<h4>
							<span class="glyphicon glyphicon-lock"></span> Authentification
						</h4>
					</div>

				</div>
				<div class="well">
					<div style="padding-top: 30px" class="panel-body">

						<div style="display: none" id="login-alert"
							class="alert alert-danger col-sm-12"></div>

						<form name='login' action="<c:url value='/loginPage' />"
							method='POST' class="form-horizontal" role="form">



							<div class="form-group">
								<label class="control-label col-sm-4" for="username">Username&nbsp;
									&nbsp; :</label>
								<div class="col-sm-6">
									<input type="text" class="form-control" id="username" value=''
										placeholder="Your User Name">
								</div>
							</div>
							<br>

							<div class="form-group">
								<label class="control-label col-sm-4" for="pwd">Password&nbsp;
									&nbsp;:</label>
								<div class="col-sm-6">
									<input type="password" class="form-control" id="pwd"
										placeholder="Your Password">
								</div>
							</div>

							<br> <br>

							<div class="form-group">
								<div class="col-sm-offset-2 col-sm-8">
									<button type="submit" name="submit" value="submit"
										class="btn btn-primary   form-group col-sm-6">
										<span class="glyphicon glyphicon-ok"></span>&nbsp;Connect
									</button>
									<button type="submit"
										class="btn btn-warning  form-group col-sm-7"
										style="float: right;">
										<span class="glyphicon glyphicon-remove"></span>&nbsp;Cancel
									</button>
								</div>
							</div>
							<input type="hidden" name="${_csrf.parameterName}"
								value="${_csrf.token}" />
						</form>

					</div>



				</div>
			</div>
		</div>
	</div>






</body>
</html>