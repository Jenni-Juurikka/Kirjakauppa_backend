<?php
require_once '../inc/functions.php';
require_once '../inc/headers.php';

try {
    $db = openDb();
    selectAsJson($db,"select * from tuote order by category_id");

}
catch (PDOException $pdoex) {
    returnError($pdoex);
}