<?php 

$id = filter_input(INPUT_GET, "id", FILTER_SANITIZE_NUMBER_INT);
$name = filter_input(INPUT_GET, "name", FILTER_SANITIZE_STRING);

?>

<h4>Päivitä tuoteryhmän tiedot</h4>
<form action="saveupdatetr.php" method="POST">
    <div>
        <label>Tuoteryhmän numero</label>
        <input id="id" name="id" maxlength="11" type="int" required value="<?php print($id); ?>"/>
    </div>
    <div>
        <label>Tuoteryhmän nimi</label>
        <input id="name" name="name" maxlength="50" type="text" required value="<?php print($name); ?>"/>
    </div>
    <div>
        <input type="submit" value="Päivitä tuoteryhmä"/>
    </div>
</form>