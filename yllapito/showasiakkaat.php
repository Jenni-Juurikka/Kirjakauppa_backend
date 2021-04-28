<?php 

require_once '../inc/headers.php';
require_once '../inc/functions.php';

try {
    $db = openDb();
    $sql = "SELECT * FROM asiakas";
    $show = $db->query($sql);

    $data = $show->fetchAll(PDO::FETCH_ASSOC);

    // $data = [];
    // $asiakkaat = [];

    // foreach($result as $row) {
    //     array_push($asiakkaat, $row);
    // }

    // $data['asiakas'] = $asiakkaat;

    header('HTTP/1.1 200 OK');
    echo json_encode($data);


} catch(PDOException $pdoex) {
    returnError($pdoex);
}

?>