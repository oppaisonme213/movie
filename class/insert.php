<?php
require_once 'config.php';

class insert extends config{

  public function addUser($firstname, $lastname, $email, $password){
    $con = $this->con();
    $sql = "INSERT INTO user_table(firstname, lastname, email, pass)VALUES(?,?,?,?);";
    $data = $con->prepare($sql);
    try{
    if($data->execute([$firstname, $lastname, $email, $password])){
      echo '<div class="alert alert-success alert-dismissible fade show" role="alert">
                  <strong>Successfully Signed Up!</strong> Thank you for registering.
                    <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                  <span aria-hidden="true">&times;</span>
                </button>
              </div>';
    }else {
      echo '<div class="alert alert-danger alert-dismissible fade show" role="alert">
                <strong>Failed to Sign Up.</strong> Something went wrong.
                  <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                      <span aria-hidden="true">&times;</span>
                  </button>
                </div>';
            }
      }catch(PDOException $e){
        echo '<div class="alert alert-danger alert-dismissible fade show" role="alert">
                <strong>Failed to Sign Up.</strong> Something went wrong.
                  <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                      <span aria-hidden="true">&times;</span>
                  </button>
                </div>';
            
      } 
  }

  public function bookSeat($user_id, $seat_id){
    $con = $this->con();

    $sql = "UPDATE `movie_seat_table`
      SET movie_seat_table.is_available = 0 and movie_seat_table.user_id = (?) 
      WHERE movie_seat_table.seat_id = (?);";
    
    $data = $con->prepare($sql);
    try {
      if($data->execute([$user_id, $seat_id])){
        echo '<div class="alert alert-success alert-dismissible fade show" role="alert">
                    <strong>Successfully Signed Up!</strong> Thank you for registering.
                      <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                  </button>
                </div>';
      }else {
        echo '<div class="alert alert-danger alert-dismissible fade show" role="alert">
                  <strong>Failed to Sign Up.</strong> Something went wrong.
                    <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                  </div>';
              }
      }catch(PDOException $e){
        echo '<div class="alert alert-danger alert-dismissible fade show" role="alert">
                <strong>Failed to Sign Up.</strong> Something went wrong.
                  <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                      <span aria-hidden="true">&times;</span>
                  </button>
                </div>';     
      } 
    }
}
?>