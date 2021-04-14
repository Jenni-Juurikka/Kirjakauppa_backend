<?php
require_once '../inc/functions.php';
require_once '../inc/headers.php';


$db = null;

$input = json_decode(file_get_contents('php://input'));
$asnimi = filter_var($input->asnimi,FILTER_SANITIZE_STRING);
$puhelinro = filter_var($input->puhelinro,FILTER_SANITIZE_STRING);
$osoite = filter_var($input->osoite,FILTER_SANITIZE_STRING);
$postitmp = filter_var($input->postitmp,FILTER_SANITIZE_STRING);
$postinro = filter_var($input->postinro,FILTER_SANITIZE_STRING);
$maa = filter_var($input->maa,FILTER_SANITIZE_STRING);
$cart = $input->cart;

try {
    $db = openDb();
    $db->beginTransaction();

    $sql = "INSERT INTO asiakas (asnimi, puhelinro, osoite, postinro, postitmp, maa)
        VALUES ('". 
            filter_var($asnimi,FILTER_SANITIZE_STRING) . "','" . 
            filter_var($puhelinro,FILTER_SANITIZE_STRING) . "','" . 
            filter_var($osoite,FILTER_SANITIZE_STRING) . "','" . 
            filter_var($postitmp,FILTER_SANITIZE_STRING) . "','" . 
            filter_var($postinro,FILTER_SANITIZE_STRING) . "','" . 
            filter_var($maa,FILTER_SANITIZE_STRING) . "')";

    $astunnus = executeInsert($db,$sql);

    $sql = "INSERT INTO tilaus (astunnus) VALUES ($astunnus)";
    $tilausnro = executeInsert($db,$sql);

    foreach ($cart as $tuote) {
        $sql = "INSERT INTO tilaus (astunnus) 
            VALUES (" . $tilausnro . "," .
                $tuote->id .")";
        executeInsert($db, $sql);
    }

    $db->commit(); 

    
}