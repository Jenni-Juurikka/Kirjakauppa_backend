<?php 

$id = filter_input(INPUT_POST, "id", FILTER_SANITIZE_NUMBER_INT);
$name = filter_input(INPUT_POST, "name", FILTER_SANITIZE_STRING);

$host = "localhost";
$database = "kirjakauppa";
$user = "root";

try {
    $db = new PDO("mysql:host=$host;dbname=$database;chartset=utf8", $user, '');
    $db->setAttribute(PDO::ATTR_ERRMODE,PDO::ERRMODE_EXCEPTION);
    $update = $db->prepare("UPDATE tuoteryhma SET name = :name WHERE id = :id");

    $update->bindValue(":id", $id, PDO::PARAM_INT);
    $update->bindValue(":name", $name, PDO::PARAM_STR);

    $update->execute();

    header("Location: http://localhost/kirjakauppa/index.php");

} catch(PDOException $e) {
    echo "Connection failed: " . $e->getMessage();
    }

?>