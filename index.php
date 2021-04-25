<?php
  require_once 'php/init.php';
?>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>SkyFlixs</title>
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
  <script src="https://kit.fontawesome.com/6b64ccbc3b.js" crossorigin="anonymous"></script>
  <link rel="stylesheet" href="styles/styles.css">

</head>
<body>
  <div class="full-container">
    <?php
      require 'templates/navigation_bar.php';
      require 'templates/header.php';

    ?>

    

    <div class="buttons w-100 text-center my-5">
      <div class="btn-group m-auto" role="group" aria-label="Basic example">
        <button type="button" class="btn btn-secondary mx-2" href="#slider2" data-slide-to="0">Now Showing</button>
        <button type="button" class="btn btn-secondary mx-2" href="#slider2" data-slide-to="1">Coming Soon</button>
        <button type="button" class="btn btn-secondary mx-2" href="#slider2" data-slide-to="2">Advanced Ticket</button>
        <button type="button" class="btn btn-secondary mx-2" href="#slider2" data-slide-to="3">Movie Fest</button>
      </div>
    </div>

    <div class="movies1">
      <div id="slider2" class="carousel slide" data-ride="carousel">
        <div class="carousel-inner">  
          <div class="carousel-item active">
            <div class="d-block w-100" alt="First slide">
              <div class="card bg-dark text-white">
                <img class="card-img" src="https://variety.com/wp-content/uploads/2020/10/raya.jpg?w=1000" alt="Card image">
                <div class="card-img-overlay">
                  <h5 class="card-title">Card title</h5>
                  <p class="card-text">This is a wider card with supporting text below as a natural lead-in to additional content. This content is a little bit longer.</p>
                  <p class="card-text">Last updated 3 mins ago</p>
                </div>
              </div>
              
            </div>
          </div>

          <div id="movie-fest"class="carousel-item">
            <div class="d-block w-100" alt="Second slide">

            </div>
          </div>

          <div class="carousel-item">
            <div class="d-block w-100" alt="Third slide">
              
            </div>
          </div>

          <div class="carousel-item">
            <div class="d-block w-100" alt="Forth slide">
            
            </div>
          </div>

        </div>
      </div>
      <i class="fas fa-couch text-primary"></i>
    </div>
    

  </div>
  <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
</body>
</html>