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
        <button type="button" class="btn btn-secondary mx-2" href="#slider2" data-slide-to="2">Snacks</button>
        <button type="button" class="btn btn-secondary mx-2" href="#slider2" data-slide-to="3">Available Seats</button>
      </div>
    </div>

    <div class="movies1">
      <div id="slider2" class="carousel slide" data-ride="carousel">
        <div class="carousel-inner"> 

          <?php
            showMovies();
            echo '</div>';
            echo '</div>';
            echo '</div>';
            
          ?>

          <div class="carousel-item">
            <div class="d-block w-100 movie-slide" alt="Second slide">

            </div>
          </div>

          <?php
          showSnacks();
          echo '</div>';
          echo '</div>';
          echo '</div>';
          ?>
            

          <div class="carousel-item">
            <div class="d-block w-100 movie-slide" alt="Forth slide">
            <div class="btn-group btn-group-toggle w-100" data-toggle="buttons">
            <?php
              if(isset($_POST['submit'])){
                getSeats($_POST['submit']);

              }else {
                echo '<h3 class="text-center text-white mt-5">Select a Movie to see available seating';
              }
            ?>
            <button type='submit' id='movie_info' name ='submit2' class='btn btn-success btn-sm d-block m-auto mt-5'>Confirm Seat
          </div>
            
            </div>
          </div>

        </div>
      </div>
    </div>
    <?php
    
      // getSeats($_POST['submit1']);
       
  ?>
    
  </div>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
  <script src="script/script.js"></script>
  <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
</body>
</html>