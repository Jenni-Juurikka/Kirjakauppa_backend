<?php
require_once '../inc/functions.php';
require_once '../inc/headers.php';

$url = parse_url(filter_input(INPUT_SERVER,'PATH_INFO'),PHP_URL_PATH);
$criteria = $url[1];

try {
    $db = openDb();
    $sql = "select * from tuote where name like '%$criteria%'";

    selectAsJson($db, $sql);

} catch (PDOException $e) {
    returnError($e);
}

?>