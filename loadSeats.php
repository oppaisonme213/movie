<?php

$newData = $_POST['newData'];
$con = $this->con();
$sql = "SELECT * FROM `movie_seat_table`JOIN seat_table ON movie_seat_table.seat_id = seat_table.seat_id 
JOIN movie_table ON movie_seat_table.movie_id = movie_table.movie_id WHERE movie_seat_table.movie_id = ?;
";


$data = $con->prepare($sql);
$data->execute([$movie_id]);
$result=$data->fetchAll(PDO::FETCH_ASSOC);

$colCount= 0;
$entries = 0;

foreach ($result as $data){
  if($colCount <= 0){
    echo '<div id="movie-seat-row" class="row">
            <div class="col-6">';
      $colCount++;
  }

  if($entries <= 8){
    echo "<label class='btn btn-sm btn-seat'>
    <input type='radio' name='options' id='option1' autocomplete='off'>
    <i class='btn-seat fas fa-couch text-primary d-block'></i>
    <p class='d-block'> $data[seat_number] </p>
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
      echo '<div class="col-6">';
    }
  }
  
}
?>