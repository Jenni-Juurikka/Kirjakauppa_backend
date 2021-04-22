<?php
session_start();
require_once 'inc/headers.php';
require_once 'inc/functions.php';

$username = filter_input(INPUT_POST, 'astunnus', FILTER_SANITIZE_STRING);
$password = filter_input(INPUT_POST, 'salasana', FILTER_SANITIZE_STRING);

$sql = "select * from asiakas where astunnus = '$username'";

try {
    $db = new PDO("mysql:host=localhost;dbname=kirjakauppa;chartset=utf8", 'root', '');
    $query = $db->query($sql);
    $user = $query->fetch(PDO::FETCH_OBJ);
    if ($user) {
    $salasanaDb = $user->salasana;  
    if (password_verify($password, $salasanaDb)) {
        header('HTTP/1.1 200 OK');
        $data = array (
            'id' => $user->astunnus,
            'asnimi' => $user->asnimi,
            'password' => $user->salasana
        );
        $_SESSION['user'] = $user;
    } else {
        header('HTTP/1.1 401 Unauthorized');
        $data = array('message' => "Unsuccessfull login.");
      }
    } else {
      header('HTTP/1.1 401 Unauthorized');
      $data = array('message' => "Unsuccessfull login.");
    }
    
    echo json_encode($data);
} catch (PDOException $e) {
    returnError($e);
}
?>