<?php
  function registerUser($firstname, $lastname, $email, $password){
    $insert = new insert;
    $insert->addUser($firstname, $lastname, $email, $password);
  }

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

  function getUser($firstname, $lastname, $email, $pass, $seat_id, $movie_name){
    $view = new view;
    $view->getUser($firstname, $lastname, $email, $pass, $seat_id, $movie_name);
  }
?>