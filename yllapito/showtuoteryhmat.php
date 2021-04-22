<?php 

require_once '../inc/headers.php';
require_once '../inc/functions.php';

try {
    $db = openDb();
    $sql = "SELECT * FROM tuoteryhma";
    $show = $db->query($sql);

    $data = $show->fetchAll(PDO::FETCH_ASSOC);
    header('HTTP/1.1 200 OK');
    echo json_encode($data);


} catch(PDOException $pdoex) {
    returnError($pdoex);
}

?>