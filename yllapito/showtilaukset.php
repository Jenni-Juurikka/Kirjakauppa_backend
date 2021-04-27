<?php 

require_once '../inc/headers.php';
require_once '../inc/functions.php';

try {
    $db = openDb();
    $sql = "SELECT asiakas.astunnus, tilaus.tilausnro, tilaus.tilauspvm, tuote.name
        from asiakas, tilaus, tilausrivi, tuote
        where asiakas.astunnus = tilaus.astunnus AND
            tilaus.tilausnro = tilausrivi.tilausnro AND
            tilausrivi.tuotenro = tuote.id";
    $show = $db->query($sql);

    $data = $show->fetchAll(PDO::FETCH_ASSOC);
    header('HTTP/1.1 200 OK');
    echo json_encode($data);


} catch(PDOException $pdoex) {
    returnError($pdoex);
}

?>