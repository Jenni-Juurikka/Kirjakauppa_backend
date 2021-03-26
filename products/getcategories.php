<?php
require_once '../inc/functions.php';
require_once '../inc/headers.php';

print("<p>toimii</p>");

try {
    $db = openDb();
    selectAsJson($db, 'select * from tuoteryhma');
}
catch (PDOException $pdoex) {
    returnError($pdoex);
}
