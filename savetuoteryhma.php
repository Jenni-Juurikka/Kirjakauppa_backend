<?php 

require_once 'inc/headers.php';
require_once 'inc/functions.php';

$id = filter_input(INPUT_POST, "id", FILTER_SANITIZE_NUMBER_INT);
$name = filter_input(INPUT_POST, "name", FILTER_SANITIZE_STRING);

$host = "localhost";
$database = "kirjakauppa";
$user = "root";

try {
    $db = openDb();
    $save = $db->prepare("INSERT INTO tuoteryhma (id, name) 
        VALUES (:id, :name)");

    $save->bindValue(":id", $id, PDO::PARAM_INT);
    $save->bindValue(":name", $name, PDO::PARAM_STR);
    $save->execute();

    $data = 


} catch(PDOException $pdoex) {
    returnError($pdoex);
}

?>