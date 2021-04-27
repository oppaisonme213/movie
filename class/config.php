<?php

  class config {
    private $username = 'root';
    private $password = 'admin123';
    public $pdo = null;

    public function con(){
      try{
        $this->pdo = new PDO('mysql:host=127.0.0.1;dbname=seat_registration_system;port=3306', $this->username, $this->password);
      } catch (PDOException $e) {
        die($e);
      }
      return $this->pdo;
    }
  }
?>