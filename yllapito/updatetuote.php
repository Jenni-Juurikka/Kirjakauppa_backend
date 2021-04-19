<?php 

$id = filter_input(INPUT_GET, "id", FILTER_SANITIZE_NUMBER_INT);
$name = filter_input(INPUT_GET, "name", FILTER_SANITIZE_STRING);
$author = filter_input(INPUT_GET, "author", FILTER_SANITIZE_STRING);
$price = filter_input(INPUT_GET, "price", FILTER_SANITIZE_STRING);
$image = filter_input(INPUT_GET, "image", FILTER_SANITIZE_STRING);
$category_id = filter_input(INPUT_GET, "category_id", FILTER_SANITIZE_NUMBER_INT);

?> 

<h4>Päivitä tuotetietoja</h4>
<form action="saveupdatetuote.php" method="POST">
    <div>
    <div>
        <label>Tuotteen numero</label>
        <label><?php print($id); ?></label>
    </div>
        <label>Kirjan nimi</label>
        <input id="name" name="name" maxlength="100" type="text" required value="<?php print($name); ?>"/>
    </div>
    <div>
        <label>Kirjailijan nimi</label>
        <input id="author" name="author" maxlength="100" type="text" value="<?php print($author); ?>"/>
    </div>
    <div>
        <label>Hinta</label>
        <input id="price" name="price" maxlength="10" type="text" value="<?php print($price); ?>"/>
    </div>
    <div>
        <label>Kuva</label>
        <input id="image" name="image" type="file" value="<?php print($image); ?>"/>
    </div>
    <div>
        <label>Tuoteryhmä</label>
        <input id="category_id" name="category_id" maxlength="11" type="int" required value="<?php print($category_id); ?>"/>
    </div>
    <div>
        <input type="submit" value="Päivitä tuotetiedot"/>
    </div>
</form>