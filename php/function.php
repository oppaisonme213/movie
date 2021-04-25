<?php
  function showMovies(){
    $view = new view;
    $view->viewMovies();
  }

  function showSnacks(){
    $view = new view;
    $view->showSnacks();
  }

  function getSeats($movie_id){
    $view = new view;
    $view->getSeats($movie_id);

  }
?>