<form role="form"> 
	<div class="modal-header">
		<h4 class="modal-title custom_align" id="Heading">Supprimer Utulisateur</h4>
	</div>
		<div class="modal-body">
			<div class="alert alert-danger"><span class="glyphicon glyphicon-warning-sign"></span> Voulez vous supprimer cet utulisateur
			</div>
		</div>
		<div class="modal-footer ">
			<button type="button" id="submit" class="btn btn-success" ng-click="DeleteUserModalCtrl.parent.deleteUser(DeleteUserModalCtrl.selectedUserToDelete)"><span class="glyphicon glyphicon-ok-sign"></span> Oui</button>
			<button  type="button" class="btn btn-warning" ng-click="cancel()"><span class="glyphicon glyphicon-remove"></span> Non</button>
		</div>
</form>
