<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title">Create an Account</h5>
      </div>
            
      <div class="modal-body">
        <p style="font-size: .8rem;">No Account? Make one here!</p>
        <form method="POST" action="">
          
        <div class="form-group">
            <input type="text" class="form-control" id="firstname" aria-describedby="emailHelp" placeholder="First Name" name="firstname">
          </div>
          <div class="form-group">
            <input type="text" class="form-control" id="lastname" aria-describedby="emailHelp" placeholder="Last Name" name="lastname"> 
          </div>
          <div class="form-group">
            <input type="email" autocomplete="off" class="form-control" id="email" aria-describedby="emailHelp" placeholder="Email" name="email">
          </div>
          <div class="form-group">
            <input type="password" autocomplete="off" class="form-control" id="password" placeholder="Password" name="password">
          </div>
          <button type="submit" class="btn btn-outline-dark" name="submitModal" value="submitModal">Register</button>
        </form>
      </div>
      
      <div class="modal-footer">
        <button type="button" class="btn btn-outline-secondary pull-right" data-dismiss="modal">Cancel</button>
      </div>
    </div>
  </div>
</div>

<?php
  if(isset($_POST['submitModal'])){
    registerUser($_POST['firstname'], $_POST['lastname'], $_POST['email'], $_POST['password']);
  };
?>