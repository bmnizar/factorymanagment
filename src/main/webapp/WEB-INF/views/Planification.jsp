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
		<div>



			<!--------------------------------------------------------------Start of Calendar------------------------------------------------------------->
		<h2 class="text-center">{{ vm.calendarTitle }}</h2>

  <div class="row">

    <div class="col-md-6 text-center">
      <div class="btn-group">

        <button
          class="btn btn-primary"
          mwl-date-modifier
          date="vm.viewDate"
          decrement="vm.calendarView">
          Previous
        </button>
        <button
          class="btn btn-default"
          mwl-date-modifier
          date="vm.viewDate"
          set-to-today>
          Today
        </button>
        <button
          class="btn btn-primary"
          mwl-date-modifier
          date="vm.viewDate"
          increment="vm.calendarView">
          Next
        </button>
      </div>
    </div>

    <br class="visible-xs visible-sm">

    <div class="col-md-6 text-center">
      <div class="btn-group">
        <label class="btn btn-primary" ng-model="vm.calendarView" uib-btn-radio="'year'">Year</label>
        <label class="btn btn-primary" ng-model="vm.calendarView" uib-btn-radio="'month'">Month</label>
        <label class="btn btn-primary" ng-model="vm.calendarView" uib-btn-radio="'week'">Week</label>
        <label class="btn btn-primary" ng-model="vm.calendarView" uib-btn-radio="'day'">Day</label>
      </div>
    </div>

  </div>

  <br>

  <mwl-calendar
    events="vm.events"
    view="vm.calendarView"
    view-title="vm.calendarTitle"
    view-date="vm.viewDate"
    on-event-click="vm.eventClicked(calendarEvent)"
    on-event-times-changed="vm.eventTimesChanged(calendarEvent); calendarEvent.startsAt = calendarNewEventStart; calendarEvent.endsAt = calendarNewEventEnd"
    edit-event-html="'<i class=\'glyphicon glyphicon-pencil\'></i>'"
    delete-event-html="'<i class=\'glyphicon glyphicon-remove\'></i>'"
    on-edit-event-click="vm.eventEdited(calendarEvent)"
    on-delete-event-click="vm.eventDeleted(calendarEvent)"
    cell-is-open="vm.isCellOpen"
    day-view-start="06:00"
    day-view-end="22:00"
    day-view-split="30"
    cell-modifier="vm.modifyCell(calendarCell)">
  </mwl-calendar>

  <br><br><br>

  <h3 id="event-editor">
    Edit events
    <button
      class="btn btn-primary pull-right"
      ng-click="vm.events.push({title: 'New event', type: 'important', draggable: true, resizable: true})">
      Add new
    </button>
    <div class="clearfix"></div>
  </h3>

  <table class="table table-bordered">

    <thead>
      <tr>
        <th>Title</th>
        <th>Type</th>
        <th>Starts at</th>
        <th>Ends at</th>
        <th>Remove</th>
      </tr>
    </thead>

    <tbody>
      <tr ng-repeat="event in vm.events track by $index">
        <td>
          <input
            type="text"
            class="form-control"
            ng-model="event.title">
        </td>
        <td>
          <select ng-model="event.type" class="form-control">
            <option value="important">Important</option>
            <option value="warning">Warning</option>
            <option value="info">Info</option>
            <option value="inverse">Inverse</option>
            <option value="success">Success</option>
            <option value="special">Special</option>
          </select>
        </td>
        <td>
          <p class="input-group" style="max-width: 250px">
            <input
              type="text"
              class="form-control"
              readonly
              uib-datepicker-popup="dd MMMM yyyy"
              ng-model="event.startsAt"
              is-open="event.startOpen"
              close-text="Close" >
            <span class="input-group-btn">
              <button
                type="button"
                class="btn btn-default"
                ng-click="vm.toggle($event, 'startOpen', event)">
                <i class="glyphicon glyphicon-calendar"></i>
              </button>
            </span>
          </p>
          <uib-timepicker
            ng-model="event.startsAt"
            hour-step="1"
            minute-step="15"
            show-meridian="true">
          </uib-timepicker>
        </td>
        <td>
          <p class="input-group" style="max-width: 250px">
            <input
              type="text"
              class="form-control"
              readonly
              uib-datepicker-popup="dd MMMM yyyy"
              ng-model="event.endsAt"
              is-open="event.endOpen"
              close-text="Close">
            <span class="input-group-btn">
              <button
                type="button"
                class="btn btn-default"
                ng-click="vm.toggle($event, 'endOpen', event)">
                <i class="glyphicon glyphicon-calendar"></i>
              </button>
            </span>
          </p>
          <uib-timepicker
            ng-model="event.endsAt"
            hour-step="1"
            minute-step="15"
            show-meridian="true">
          </uib-timepicker>
        </td>
        <td>
          <button
            class="btn btn-danger"
            ng-click="vm.events.splice($index, 1)">
            Delete
          </button>
        </td>
      </tr>
    </tbody>

  </table>
				
			<!--------------------------------------------------------------End of Calendar------------------------------------------------------------->
				


		</div>
	</div>

</body>
</html>