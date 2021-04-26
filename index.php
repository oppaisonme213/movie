<?php
  require_once 'php/init.php';
  require 'templates/modal.php';

?>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>SkyFlixs</title>
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
  <link rel="preconnect" href="https://fonts.gstatic.com">
  <link href="https://fonts.googleapis.com/css2?family=Cantarell&display=swap" rel="stylesheet">
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
        <button type="button" class="btn btn-secondary mx-2" href="#slider2" data-slide-to="1">Snacks</button>
        <button type="button" class="btn btn-secondary mx-2" href="#slider2" data-slide-to="2">Available Seats</button>
      </div>
    </div>

    <div id="options" class="movies1">
      <div id="slider2" class="carousel slide" data-ride="carousel" data-interval="false">
        <div class="carousel-inner"> 

          <?php
            showMovies();
            echo '</div>';
            echo '</div>';
            echo '</div>';
            echo '</div>';
          ?>

          <?php
            showSnacks();
            echo '</div>';
            echo '</div>';
            echo '</div>';
            echo '</div>';
          ?>
            

          <div class="carousel-item">
            <div class="d-block w-100 movie-slide" alt="Third slide">
              <form action="" method="post">
                <div class="btn-group btn-group-toggle w-100" data-toggle="buttons">
                  <?php
                    if(isset($_POST['submit'])){
                      getSeats($_POST['submit']);
                      echo '</div>';
                      require 'templates/form.php';

                      
                    }else {
                      echo '<h5 class="text-center text-white mt-5">Select a Movie to see available seating</h5><hr>';
                    }
                  ?>            
                </div>
              </form>
              <?php
                if(isset($_POST['form-submit'])){
                  getUser($_POST['firstName'],$_POST['lastName'],$_POST['email'],$_POST['password'],$_POST['seat_id'], $_POST['movie_name']);
                }
                ?>
            </div>  
          </div>
        </div>
      </div>
    </div>

    <div id="about-us">
      <div class="m-5 py-5">
        <hr>

        <div class="row">
          <div class="col-5">
            <div class="text-center">
              <img class="mt-5 pt-5"src="images/logo3.png">
            </div>

          </div>

          <div class="col-7">
          <h3 id="about_us" class="text-center mt-2 mb-5 text-light">About Us</h3>

            <div><h5 class="text-light pr-5">SkyFlixs is a Movie Theater company established in 2021, specializing in family entertainment. The bussiness is inspired mainly by the owner's wanting to provide entertainment at a decent price – since theaters are becoming more expensive, is an important part of a ceremony in entertaining customers, that reflects a sign of respect and value for the guests. <br><br>SkyFlixs guarentees enjoyment and fun at a decent price with your money back guarenteed.</h5>
            </div>
          </div>
        </div>  
      </div>

      <div class="footer border-top border-ligt">
        <div class="copyrights mx-3"><p class="text-center text-light py-3">©Copyright - SkyFlix 2021 | Website by IT Student's of BSIT - 3A | All Rights Reserved</p></div>
        </div>
      </div>
    </div>
  </div>

  <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
  <script src="script/script.js"></script>
  <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
</body>
</html>