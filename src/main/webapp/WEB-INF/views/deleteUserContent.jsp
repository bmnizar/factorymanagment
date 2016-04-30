<form role="form"> 
<div class="modal-header"><h2>Confirmation</h2></div>
<div class="modal-body">Voulez-vous supprimer cette élement ? </div>
<div class="modal-footer">
    <button type="button" id="submit" class="btn btn-primary" ng-click="DeleteUserModalCtrl.parent.deleteUser(DeleteUserModalCtrl.selectedUserToDelete)">Confirmer</button>
    <button class="btn" ng-click="cancel()">Annuler</button>
</div>
</form>
