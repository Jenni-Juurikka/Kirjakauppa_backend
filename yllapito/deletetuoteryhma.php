<?php 

require_once '../inc/headers.php';
require_once '../inc/functions.php';

$input = json_decode(file_get_contents('php://input'));
$id = filter_var($input->id, FILTER_SANITIZE_NUMBER_INT);


try {
    $db = openDb();
    $del = $db->prepare("DELETE FROM tuoteryhma WHERE id = (:id)");

    $del->bindValue(":id", $id,PDO::PARAM_INT);

    $del->execute();

    header('HTTP/1.1 200 OK');
    $data = array('id' => $id);
    echo json_encode($data);

    
} catch(PDOException $pdoex) {
    returnError($pdoex);
}

?>