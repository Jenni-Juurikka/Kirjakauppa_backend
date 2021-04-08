<?php 

$id = filter_input(INPUT_POST, "id", FILTER_SANITIZE_NUMBER_INT);
$name = filter_input(INPUT_POST, "name", FILTER_SANITIZE_STRING);

$host = "localhost";
$database = "kirjakauppa";
$user = "root";

try {
    $db = new PDO("mysql:host=$host;dbname=$database;chartset=utf8", $user, '');
    $db->setAttribute(PDO::ATTR_ERRMODE,PDO::ERRMODE_EXCEPTION);
    $save = $db->prepare("INSERT INTO tuoteryhma (id, name) 
        VALUES (:id, :name)");

    $save->bindValue(":id", $id, PDO::PARAM_INT);
    $save->bindValue(":name", $name, PDO::PARAM_STR);

    $save->execute();

    header("Location: http://localhost/kirjakauppa/index.php");

} catch(PDOException $e) {
    echo "Connection failed: " . $e->getMessage();
    }

?>