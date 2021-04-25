let movieSelection = "";
function getBtns(movie_id){
  let btns = document.querySelectorAll('.movie-btn');

  for(var i = 0; i < btns.length;i++){
    if(movie_id == btns[i].value){
      movieSelection = movie_id
    }
  }
  console.log(movieSelection);

}

$(document).ready(function(){
  $(".movie-btn").click(function(){
    var data = 3
    $("#movie-seat-row").load("loadSeats.php", {
      newData: data
    });
    
  })
})
