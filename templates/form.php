<?php
echo '
<div class="row m-auto">
  <div class="col-sm-12">
    <form id="info-form" class="m-auto p-5">
    <div class="form-group">
      <label for="firstName">First Name</label>
      <input type="text" class="form-control" id="firstName" placeholder="Enter First Name" name="firstName">
    </div>

    <div class="form-group">
      <label for="lastName">Last Name</label>
      <input type="text" class="form-control" id="lastName" placeholder="Enter Last Name" name="lastName">
    </div>

    <div class="form-group">
      <label for="email">Email</label>
      <input type="email" class="form-control" id="email" placeholder="Enter Email" name="email">
    </div>

    <div class="form-group">
      <label for="password">Password</label>
      <input type="password" class="form-control" id="password" placeholder="Enter Password" name="password">
    </div>

    <a href="#exampleModal" data-toggle="modal"><p>Need an Account? Create one here!</p></a>

    <div class="w-100 mt-4 m-auto">
    <button type="submit" id="movie_info" name ="submit2" class="btn btn-success btn-md d-block m-auto mt-5
      ">Confirm Seat
    </div>         
    </form>
    </div>
    </div>';
?>