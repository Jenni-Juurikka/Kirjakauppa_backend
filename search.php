<?php
require_once 'inc/functions.php';
require_once 'inc/headers.php';

$url = parse_url(filter_input(INPUT_SERVER,'PATH_INFO'),PHP_URL_PATH);
$criteria = $url[1];

try {
    $db = new PDO("mysql:host=localhost;dbname=kirjakauppa;chartset=utf8", 'root', '');
    $sql = "select * from tuote where name like '%$criteria%'";
    $query = $db->query($sql);
    $results = $query->fetchAll(PDO::FETCH_ASSOC);
    echo header('HTTP/1.1 200 OK');
    echo json_encode($results);
} catch (PDOException $e) {
    returnError($e);
}

?>