<?php
require_once 'inc/headers.php';
require_once 'inc/functions.php';

// saattaa valittaa return erroreista jos käyttää plugaria mutta pitäisi toimia ilman ongelmia //

// katsotaan että tiedosto on ylipäätänsä asetettu // 
if (isset($_FILES['file'])) {
  // tarkistetaan että ei ole virhettä // 
    if ($_FILES['file']['error'] === UPLOAD_ERR_OK) {
      // luetaan tiedoston alkuperäinen nimi // 
      $filename = $_FILES['file']['name'];
      // katsotaan tiedoston tyyppi // 
      $type = $_FILES['file']['type'];
      // halutaan tallentaa pelkästään .png tiedosotyyppiä turvallisuuden vuoksi (Ei voi ladata scriptiä yms.) //
      if ($type === 'image/png') {
        $path = "img/" . basename($filename);
        // määritellään minne tiedosto halutaan tallettaa //
        if (move_uploaded_file($_FILES['file']['tmp_name'],$path)) {
          $data = array('filename' => $filename);
          echo json_encode($data);
        } else {
          returnError("Tiedoston tallentaminen img-kansioon epäonnistui");
        }
      } else {
          returnError("Kuvan tyyppi virheellinen lataa .png tiedosto");
      }
    } else {
    returnError("Kuvaa ei voitu ladata selaimelta");
  }
}

?>