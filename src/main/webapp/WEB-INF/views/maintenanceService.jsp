<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<head>
<!-- <link href="scripts/angular-material.css" rel="stylesheet" /> -->
</head>
<link rel="stylesheet" href="scripts/bootstrap.css">
<script src="scripts/jquery-1.12.1.js"></script>

<script src="scripts/bootstrap.js"></script>
<script src="scripts/angular.js"></script>
<script src="scripts/ui-bootstrap-tpls-1.2.4.js"></script>
<script src="scripts/angular-animate.js"></script>
<script src="scripts/angular-aria.js"></script>
<script src="scripts/angular-messages.js"></script>
<!-- <script src="scripts/angular-material.js"></script> -->
<script src="scripts/angular-cookies.js"></script>
<script src="scripts/bootbox.js"></script>
<script src="scripts/app.js"></script>
<script src="scripts/createUser.js"></script>
<script src="scripts/user_service.js"></script>
<script src="scripts/user_controller.js"></script>
  <!-- you don't need ignore=notused in your code, this is just here to trick the cache -->
    <script src="scripts/ag-grid.js?ignore=notused19"></script>
    <script src="scripts/exampleAgGrid.js"></script>


</head>
<body ng-app="basic">

    <div ng-controller="basicController" style="width: 800px;">
        <div style="padding: 4px">
            <div style="float: right;">
                <input type="text" ng-model="gridOptions.quickFilterText" placeholder="Type text to filter..."/>
            </div>
            <div style="padding: 4px;">
                <b>Employees Skills and Contact Details</b> ({{rowCount}})
            </div>
            <div style="clear: both;"/>
        </div>
        <div style="width: 100%; height: 400px;"
             ag-grid="gridOptions"
             class="ag-fresh ag-basic">
        </div>
    </div>

</body>
</html>
