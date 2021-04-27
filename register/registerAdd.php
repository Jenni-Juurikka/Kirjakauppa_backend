<?php
require_once '../inc/functions.php';
require_once '../inc/headers.php';


$db = null;

$input = json_decode(file_get_contents('php://input'));
$astunnus = filter_var($input->username,FILTER_SANITIZE_STRING);
$asnimi = filter_var($input->asnimi,FILTER_SANITIZE_STRING);
$salasana = filter_var($input->salasana,FILTER_SANITIZE_STRING);
$puhelinro = filter_var($input->puhelinro,FILTER_SANITIZE_STRING);
$osoite = filter_var($input->osoite,FILTER_SANITIZE_STRING);
$postitmp = filter_var($input->postitmp,FILTER_SANITIZE_STRING);
$postinro = filter_var($input->postinro,FILTER_SANITIZE_STRING);
$maa = filter_var($input->maa,FILTER_SANITIZE_STRING);
$hash = password_hash($salasana, PASSWORD_DEFAULT);

try {
    $db = openDb();

    $sql = "INSERT INTO asiakas (username, asnimi, salasana, puhelinro, osoite, postinro, postitmp, maa)
    VALUES ('".
        filter_var($astunnus,FILTER_SANITIZE_STRING) . "','" . 
        filter_var($asnimi,FILTER_SANITIZE_STRING) . "','" . 
        filter_var($hash,FILTER_SANITIZE_STRING) . "','" . 
        filter_var($puhelinro,FILTER_SANITIZE_STRING) . "','" . 
        filter_var($osoite,FILTER_SANITIZE_STRING) . "','" . 
        filter_var($postitmp,FILTER_SANITIZE_STRING) . "','" . 
        filter_var($postinro,FILTER_SANITIZE_STRING) . "','" . 
        filter_var($maa,FILTER_SANITIZE_STRING) . "')";

    $astunnus = executeInsert($db,$sql);


    header('HTTP/1.1 200 OK');
    $data = array('id' => $astunnus);
    echo json_encode($data);
}
catch (PDOException $pdoex) {
    returnError($pdoex);
}