<?php

require_once 'config.php';

class view extends config{
  
  public function viewMovies(){
    $con = $this->con();
    $sql = "select * from `movie_table`";
    $data = $con->prepare($sql);
    $data->execute();
    $result=$data->fetchAll(PDO::FETCH_ASSOC);
    $cardCount=0;
    $caroCount=0;
    $cardDeck=0;
    $count = 0;
    foreach ($result as $data){
      if($count <=7 ){
        $count++;
        if($caroCount === 0){
          echo "<div class='carousel-item active'>";
          echo "<h3 class='text-center py-4 text-light'> Now Playing!</h3>";
          echo "<div class='d-block w-100 movie-slide' alt='First slide'>";
          echo "<div class='card-group mb-4'>";
          echo "<div class='row no-gutters'>";

        }

        if($cardCount >= 4){
          $cardCount =0;
          $cardDeck++;
          if($cardDeck <= 1){
            echo "</div>";
            echo "</div>";

            echo "<div class='card-group mb-4'>";
            echo "<div class='row no-gutters'>";

          }else if($cardDeck > 1){
            echo "</div>";
            echo "</div>";


            echo "<div class='card-group mb-4'>";
            echo "<div class='row no-gutters'>";

            $cardDeck = 0;
          }
        }

        echo "<div class='col-lg-3'>
                <div class='card'>
                <img class='img-card-top' src=$data[image_path] alt='Card image cap'>
                  <div class='card-body m-auto text-center'>
                    <h6 class='card-title text-center'>$data[movie_name]</h6>
                    <form method='POST'>
                      <button type='submit' id='movie_info' name ='submit' value='$data[movie_id]'class='btn btn-outline-light btn-sm movie-btn'>
                      <i class='fa fa-ticket nav-text text-center fa-lg'><div class='my-2'>Book Seat</div></i></button>
                    </form>
                  </div>
                </div>
              </div>";
            $caroCount++; 
            $cardCount++;
      }
    }
  }

  public function getSeats($movie_id){

    $con = $this->con();
    $sql = "SELECT * FROM `movie_seat_table`JOIN seat_table ON movie_seat_table.seat_id = seat_table.seat_id 
    JOIN movie_table ON movie_seat_table.movie_id = movie_table.movie_id WHERE movie_seat_table.movie_id = ?;
    ";
    $data = $con->prepare($sql);
    $data->execute([$movie_id]);
    $result=$data->fetchAll(PDO::FETCH_ASSOC);

    $colCount= 0;
    $entries = 0;

    // print_r($result);

    echo '<h3 class="text-center text-light py-4">'.$result[1]['movie_name'].'</h3>';
    echo '<span><img class="booking-img w-50 d-block ml-auto mr-auto mb-4" src='.$result[1]['image_path'].'></span>';

    foreach ($result as $data){
      if($colCount <= 0){
        echo '<div id="movie-seat-row" class="row">
                <div class="col-md-6 seat-col d-flex justify-content-around border border-dark">';
          $colCount++;
      }

      if($entries <= 8){
        echo "<label class='btn btn-sm btn-seat p-1 m-0'>
        ";
        if(boolval($data['is_available']) === true){
          echo "<input type='radio' name='seat_number' id='option' autocomplete='off' value=$data[seat_id]>
          <i class='btn-seat fas fa-couch text-dark d-block'></i>";
        }else if(boolval($data['is_available']) === false) {
          echo "<input type='radio' name='seat_number' id='option' autocomplete='off' disabled value=$data[seat_id]>
          <i class='btn-seat fas fa-couch text-white d-block'></i>";
        }
        echo "<p class='d-block'> $data[seat_number] </p>
        </label>";
        $entries++;
      }

      if($entries > 8){
        if($colCount >=2){
          $colCount = 0;
          $entries = 0;
          echo '</div>';
          echo '</div>';

        }
        else{
          $colCount++;
          $entries = 0;
          echo '</div>';
          echo '<div class="col-md-6 seat-col d-flex justify-content-around border border-dark">';
        }
      }
      
    }
  }

  public function showSnacks(){
    $con = $this->con();
    $sql = "select * from `food_table`";
    $data = $con->prepare($sql);
    $data->execute();
    $result=$data->fetchAll(PDO::FETCH_ASSOC);
    $cardCount=0;
    $caroCount=0;
    $cardDeck=0;
    $count = 0;

    foreach ($result as $data){
      if($count <=7){
        $count++;
        if($caroCount === 0){
          echo "<div id='food_container'class='carousel-item'>";
          echo "<h3 class='text-center py-4 text-light'> Available Treats!</h3>";
          echo "<div class='d-block w-100 movie-slide' alt='Third slide'>";
          echo "<div class='card-deck mb-4'>";
          echo "<div class='row m-auto no-gutters'>";

        }

        if($cardCount >= 4){
          $cardCount =0;
          $cardDeck++;
          if($cardDeck <= 1){
            echo "</div>";
            echo "</div>";
            echo "<div class='card-deck mb-4'>";
            echo "<div class='row m-auto no-gutters'>";

          }else if($cardDeck > 1){
            echo '<div class="w-100 d-none d-md-block"></div>';

            echo "</div>";
            echo "</div>";
            echo "</div>";


            echo "<div class='card-deck mb-4'>";
            echo "<div class='row m-auto no-gutters'>";

            $cardDeck = 0;
          }
        }

          echo " <div class='col-lg-3'>
                  <div class='card'>
                    <img class='img-card-top' src=$data[image_source] alt='Card image cap'>
                    <div class='card-body m-auto text-center'>
                      <h6 class='card-title text-center'>$data[food_name]</h6>
                      <div class='text-center text-light'>$data[price] php</div>
                    </div>
                  </div>
                </div>";
            $caroCount++; 
            $cardCount++;
      }
      
    }
  }

  function getUser($firstname, $lastname, $email, $pass, $seatNumber){
    $con = $this->con();
    $sql = "SELECT * FROM `user_table` WHERE firstName = ? AND lastName = ? AND email = ? AND pass = ?;";

    $data = $con->prepare($sql);
    // $result=$data->fetchAll(PDO::FETCH_ASSOC);
    try{
      $data->execute([$firstname, $lastname, $email, $pass]);
      $result=$data->fetchAll(PDO::FETCH_ASSOC);

      if($result != null && $result != 0){
        $this->bookSeat($result[0]['user_id'], $seatNumber);
      }else {
        echo '<div class="alert alert-danger alert-dismissible fade show" role="alert">
        <strong>Failed to Sign Up.</strong> User not found!
          <button type="button" class="close" data-dismiss="alert" aria-label="Close">
              <span aria-hidden="true">&times;</span>
          </button>
        </div>';
      }
    }catch(PDOException $e){

    }


  }

  function bookSeat($user_id, $seatNumber){
    $insert = new insert;
    $insert->bookSeat($user_id, $seatNumber);
  }
}

?>