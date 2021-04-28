<?php
ob_start();
session_start();
require_once '../inc/functions.php';
require_once '../inc/headers.php';

$username = filter_input(INPUT_POST, 'username', FILTER_SANITIZE_STRING);
$password = filter_input(INPUT_POST, 'salasana', FILTER_SANITIZE_STRING);

$sql = "select * from asiakas where username = '$username'";

try {
    $db = openDb();
    $query = $db->query($sql);
    $user = $query->fetch(PDO::FETCH_OBJ);
    if ($user) {
    $salasanaDb = $user->salasana;  
    if (password_verify($password, $salasanaDb)) {
        header('HTTP/1.1 200 OK');
        $data = array (
            'username' => $user->username,
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