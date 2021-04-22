<?php
session_start();
require_once 'inc/headers.php';
require_once 'inc/functions.php';

// Tämä tekee sen että jos kirjautumista ei ole niin ei päästetä katsomaan tiettyä asiaa
// esim oma profiilia tms.

if (!isset($_SESSION['user'])) {
    header('HTTP/1.1 401 Unauthorized');
    exit;
}

$data = array('message' => "This is super secret information >:)");
echo json_encode($data);