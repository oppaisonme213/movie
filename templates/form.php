<div class="pt-2 d-block">
  <i class='btn-seat ml-5 fas fa-couch text-dark d-block mb-2'> Available</i>
  <i class='btn-seat ml-5 fas fa-couch text-light d-block'> Booked</i>
</div>


<div id="info-form" class="row booking-form m-auto">
  <div class="col-sm-12 bg-dark text-light p-5 form-border">
    <h5>Enter Credentials to Book your seat!</h5>
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
      <input type="email" autocomplete="off" class="form-control" id="email" placeholder="Enter Email" name="email">
    </div>

    <div class="form-group">
      <label for="password">Password</label>
      <input type="password" autocomplete="off" class="form-control" id="password" placeholder="Enter Password" name="password">
    </div>

    <a href="#exampleModal" data-toggle="modal"><p>Need an Account? Create one here!</p></a>

    <div class="w-100 mt-4 m-auto">
      <button type='submit' id='movie_info' name='form-submit' value='form-submit'class='btn btn-outline-light btn-sm movie-btn d-block m-auto'>Confirm Seat</button>         
    </div>
  </div>
</div>