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
          echo "<div class='card-deck mb-4'>";
        }

        if($cardCount >= 4){
          $cardCount =0;
          $cardDeck++;
          if($cardDeck <= 1){
            echo "</div>";
            echo "<div class='card-deck mb-4'>";
          }else if($cardDeck > 1){
            echo "</div>";
            echo "</div>";

            echo "<div class='card-deck mb-4'>";
            $cardDeck = 0;
          }
        }

        echo "<div class='card'>
              <img class='img-card-top' src=$data[image_path] alt='Card image cap'>
              <div class='card-body m-auto text-center'>
                <h6 class='card-title text-center'>$data[movie_name]</h6>
                <form method='POST'>
                  <button type='submit' id='movie_info' name ='submit' value='$data[movie_id]'class='btn btn-success btn-sm movie-btn' data-toggle='modal' data-target='#seatModal'>
                  <i class='fa fa-ticket nav-text text-center fa-lg'><div class='my-2'>Book Seat</div></i></button>
                </form>
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
    foreach ($result as $data){
      if($colCount <= 0){
        echo '<div id="movie-seat-row" class="row">
                <div class="col-6 seat-col d-flex justify-content-around border border-dark">';
          $colCount++;
      }

      if($entries <= 8){
        echo "<label class='btn btn-sm btn-seat'>
        ";
        if(boolval($data['is_available']) === true){
          echo "<input type='radio' name='options' id='option1' autocomplete='off'>
          <i class='btn-seat fas fa-couch text-dark d-block'></i>";
        }else if(boolval($data['is_available']) === false) {
          echo "<input type='radio' name='options' id='option' autocomplete='off' disabled>
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
          echo '<div class="col-6 seat-col d-flex justify-content-around border border-dark">';
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
        }

        if($cardCount >= 4){
          $cardCount =0;
          $cardDeck++;
          if($cardDeck <= 1){
            echo "</div>";
            echo "<div class='card-deck mb-4'>";
          }else if($cardDeck > 1){
            echo "</div>";
            echo "</div>";

            echo "<div class='card-deck mb-4'>";
            $cardDeck = 0;
          }
        }

        echo "<div class='card'>
              <img class='img-card-top' src=$data[image_source] alt='Card image cap'>
              <div class='card-body m-auto text-center'>
                <h6 class='card-title text-center'>$data[food_name]</h6>
                <div class='text-center text-light'>$data[price] php</div>
              </div>
            </div>";
            $caroCount++; 
            $cardCount++;
      }
      
    }
  }
}

?>