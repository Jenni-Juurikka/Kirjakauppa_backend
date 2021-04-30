<?php 

require_once '../inc/headers.php';
require_once '../inc/functions.php';

$input = json_decode(file_get_contents('php://input'));
$name = filter_var($input->name, FILTER_SANITIZE_STRING);
$author = filter_var($input->author, FILTER_SANITIZE_STRING);
$price = filter_var($input->price, FILTER_SANITIZE_STRING);
$image = filter_var($input->image, FILTER_SANITIZE_STRING);
$description = filter_var($input->description, FILTER_SANITIZE_STRING);
$category_id = filter_var($input->category_id, FILTER_SANITIZE_NUMBER_INT);


try {
    $db = openDb();

    $save = $db->prepare("INSERT INTO tuote (name, author, price, image, description, category_id) 
         VALUES (:name, :author, :price, :image, :description, :category_id)");

    $save->bindValue(":name", $name, PDO::PARAM_STR);
    $save->bindValue(":author", $author, PDO::PARAM_STR);
    $save->bindValue(":price", $price, PDO::PARAM_STR);
    $save->bindValue(":image", $image, PDO::PARAM_STR);
    $save->bindValue(":description", $description, PDO::PARAM_STR)
    $save->bindValue(":category_id", $category_id, PDO::PARAM_INT);

    $save->execute();

    header('HTTP/1.1 200 OK');

    $data = array('id' => $db->lastInsertId(), 'name' => $name, 'author' => $author, 
        'price' => $price, 'image' => $image, 'description' => $description,  'category_id' => $category_id);
    echo json_encode($data);


} catch(PDOException $pdoex) {
    returnError($pdoex);
}

?>