<?php
require_once 'inc/headers.php';
require_once 'inc/functions.php';

$username = filter_input(INPUT_POST, 'astunnus', FILTER_SANITIZE_STRING);
$password = filter_input(INPUT_POST, 'salasana', FILTER_SANITIZE_STRING);

$sql = "select * from asiakas where astunnus = '$username'";

try {
    $db = new PDO("mysql:host=localhost;dbname=kirjakauppa;chartset=utf8", 'root', '');
    // suorittaa sql lauseen.
    $query = $db->query($sql);
    // Haetaan tietokannasta se yksi rivi joka löytyy usernamella.
    // FETCH_OBJ Hakee tiedon objectina eli oliona.
    // Fetch_OBJ voi korvata hakemalla hakasuluilla [] jos haluaa.
    $kayttaja = $query->fetch(PDO::FETCH_OBJ);
    // Kun haetaan Fetch_obj nuoli syntaksilla löytyy kentät tietokannasta.
    $salasanaDb = $kayttaja->salasana; 
    // Tarkistaa onko salattu salasana ja selkokielinen salasana samat. 
    if (password_verify($password, $salasanaDb)) {
        header('HTTP/1.1 200 OK');
        $data = array (
            'id' => $kayttaja->astunnus,
            'asnimi' => $kayttaja->asnimi,
        );
    // Jos salasana on väärin.
    // header('HTTP/1.1 401 Unauthorized'); tarkoittaa että palvelua on kutsuttu väärällä tunnistella.
    } else {
        header('HTTP/1.1 401 Unauthorized');
        $data = array('');
    }
    // Mentiin sitten iffiin tai elseen palautetaan data-taulukko jsonina.
    echo json_encode($data);
} catch (PDOException $e) {
    returnError($e);
}

?>