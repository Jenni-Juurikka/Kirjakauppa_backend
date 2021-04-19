<?php 

require_once '../inc/headers.php';
require_once '../inc/functions.php';

$input = json_decode(file_get_contents('php://input'));
$name = filter_var($input->name, FILTER_SANITIZE_STRING);

$host = "localhost";
$database = "kirjakauppa";
$user = "root";

try {
    $db = openDb();
    $save = $db->prepare("INSERT INTO tuoteryhma (name) 
        VALUES (:name)");

    $save->bindValue(":name", $name, PDO::PARAM_STR);
    $save->execute();

    $data = array('id' => $db->lastInsertId(), 'name' => $name);
    echo json_encode($data);


} catch(PDOException $pdoex) {
    returnError($pdoex);
}

?>