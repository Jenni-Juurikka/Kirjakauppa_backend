<?php
$astunnus = "Jmankisenmaa";
$asnimi = "Joonas Mankisenmaa";
$salasana = password_hash("auto123",PASSWORD_DEFAULT);
$puhelinro = "0501233456778";
$osoite = "Katukuja5";
$postitmp = "Michigan";
$postinro = "90420";
$maa = "Hell";
$asvuosi = "1800";


$sql = "insert into asiakas(astunnus, asnimi, salasana, puhelinro, osoite, postitmp, postinro, maa, asvuosi) 
values ('$astunnus', '$asnimi', '$salasana', '$puhelinro', '$osoite', '$postitmp', '$postinro', '$maa', '$asvuosi')";
echo $sql;
?>