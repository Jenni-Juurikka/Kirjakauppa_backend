<?php 

require_once '../inc/functions.php';
require_once '../inc/headers.php';

$uri = parse_url(filter_input(INPUT_SERVER,'PATH_INFO'),PHP_URL_PATH);

$parameters = explode('/',$uri);

$id = $uri[1];

try {
    $db = openDb();
    selectAsJson($db,"select * from tuote where id = $id");

}
catch (PDOException $pdoex) {
    returnError($pdoex);
}