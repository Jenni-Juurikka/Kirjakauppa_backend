<?php 

$id = filter_input(INPUT_POST, "id", FILTER_SANITIZE_NUMBER_INT);
$name = filter_input(INPUT_POST, "name", FILTER_SANITIZE_STRING);
$author = filter_input(INPUT_POST, "author", FILTER_SANITIZE_STRING);
$price = filter_input(INPUT_POST, "price", FILTER_SANITIZE_STRING);
$image = filter_input(INPUT_POST, "image", FILTER_SANITIZE_STRING);
$category_id = filter_input(INPUT_POST, "category_id", FILTER_SANITIZE_NUMBER_INT);

$host = "localhost";
$database = "kirjakauppa";
$user = "root";

try {
    $db = new PDO("mysql:host=$host;dbname=$database;chartset=utf8", $user, '');
    $db->setAttribute(PDO::ATTR_ERRMODE,PDO::ERRMODE_EXCEPTION);
    $save = $db->prepare("INSERT INTO tuote (id, name, author, price, image, category_id) 
        VALUES (:id, :name, :author, :price, :image, :category_id)");

    $save->bindValue(":id", $id, PDO::PARAM_INT);
    $save->bindValue(":name", $name, PDO::PARAM_STR);
    $save->bindValue(":author", $author, PDO::PARAM_STR);
    $save->bindValue(":price", $price, PDO::PARAM_STR);
    $save->bindValue(":image", $image, PDO::PARAM_STR);
    $save->bindValue(":category_id", $category_id, PDO::PARAM_INT);

    $save->execute();

    header("Location: http://localhost/kirjakauppa/index.php");

} catch(PDOException $e) {
    echo "Connection failed: " . $e->getMessage();
    }

?>