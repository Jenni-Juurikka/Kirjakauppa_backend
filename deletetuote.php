<?php 

$id = filter_input(INPUT_GET, "id", FILTER_SANITIZE_NUMBER_INT);
$name = filter_input(INPUT_GET, "name", FILTER_SANITIZE_STRING);
$author = filter_input(INPUT_GET, "author", FILTER_SANITIZE_STRING);
$price = filter_input(INPUT_GET, "price", FILTER_SANITIZE_STRING);
$image = filter_input(INPUT_GET, "image", FILTER_SANITIZE_STRING);
$category_id = filter_input(INPUT_GET, "category_id", FILTER_SANITIZE_NUMBER_INT);

$host = "localhost";
$database = "kirjakauppa";
$user = "root";

try {
    $db = new PDO("mysql:host=$host;dbname=$database;chartset=utf8", $user, '');
    $db->setAttribute(PDO::ATTR_ERRMODE,PDO::ERRMODE_EXCEPTION);
    $del = $db->prepare("DELETE from tuote WHERE id = :id");

    $del->bindValue(":id", $id, PDO::PARAM_INT);

    $del->execute();

    header("Location: http://localhost/kirjakauppa/index.php");

} catch(PDOException $e) {
    echo "Connection failed: " . $e->getMessage();
    }

?>