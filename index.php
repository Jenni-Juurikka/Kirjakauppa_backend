<!DOCTYPE html>
<html>
    <head>
        <title>Kirjakaupan ylläpito</title>
    </head>
    <body>
        <div id="tuoteryhmat">
            <h4>Tuoteryhmät</h4>
            <form action="savetuoteryhma.php" method="POST">
                <div>
                    <label>Tuoteryhmän numero</label>
                    <input id="id" name="id" maxlength="11" type="int" required />
                </div>
                <div>
                    <label>Tuoteryhmän nimi</label>
                    <input id="name" name="name" maxlength="50" type="text" required />
                </div>
                <div>
                    <input type="submit" value="Lisää uusi tuoteryhmä"/>
                </div>
            </form>
            <?php 
                $host = "localhost";
                $database = "kirjakauppa";
                $user = "root";

                try {
                    $db = new PDO("mysql:host=$host;dbname=$database;chartset=utf8", $user, '');
                    $db->setAttribute(PDO::ATTR_ERRMODE,PDO::ERRMODE_EXCEPTION);
                    $lue = $db->prepare("SELECT * FROM tuoteryhma");
                    $lue->execute();

                    $lue->setFetchMode(PDO::FETCH_ASSOC);

                    $result = $lue->fetchAll();

                    echo "<table border='1'>
                    <tr>
                    <th>Tuoteryhmän numero</th>
                    <th>Tuoteryhmän nimi</th>
                    <th>Poista</th>
                    <th>Muokkaa</th>
                    </tr>";


                    foreach ($result as $row) {
                        echo "<tr>";
                        echo "<td>" . $row['id'] . "</td>";
                        echo "<td>" . $row['name'] . "</td>";

                        $id = $row['id'];
                        $name = $row['name'];

                        echo "<td><a href='deletetuoteryhma.php?id=$id'>Delete</a></td>";

                        echo "<td><a href='updatetuoteryhma.php?id=$id&name=$name'>Update</a></td>";

                    }

                    echo "</table>";

                    
                }
                catch (PDOException $pdoex) {
                    returnError($pdoex);
                }

            ?>
        </div>
        <div id="tuotteet">
            <h4>Tuotteet</h4>
            <form action="savetuote.php" method="POST">
                <div>
                    <label>Kirjan nimi</label>
                    <input id="name" name="name" maxlength="100" type="text" required />
                </div>
                <div>
                    <label>Kirjailijan nimi</label>
                    <input id="author" name="author" maxlength="100" type="text"/>
                </div>
                <div>
                    <label>Hinta</label>
                    <input id="price" name="price" maxlength="10" type="text"/>
                </div>
                <div>
                    <label>Kuva</label>
                    <input id="image" name="image" type="file"/>
                </div>
                <div>
                    <label>Tuoteryhmä</label>
                    <input id="category_id" name="category_id" maxlength="11" type="int" required/>
                </div>
                <div>
                    <input type="submit" value="Lisää uusi tuote"/>
                </div>
            </form>
            <?php 
                $host = "localhost";
                $database = "kirjakauppa";
                $user = "root";

                try {
                    $db = new PDO("mysql:host=$host;dbname=$database;chartset=utf8", $user, '');
                    $db->setAttribute(PDO::ATTR_ERRMODE,PDO::ERRMODE_EXCEPTION);
                    $lue = $db->prepare("SELECT * FROM tuote");
                    $lue->execute();

                    $lue->setFetchMode(PDO::FETCH_ASSOC);

                    $result = $lue->fetchAll();

                    echo "<table border='1'>
                    <tr>
                    <th>Tuotteen numero</th>
                    <th>Kirjan nimi</th>
                    <th>Kirjailijan nimi</th>
                    <th>Hinta</th>
                    <th>Kuva</th>
                    <th>Tuoteryhmä</th>
                    <th>Poista</th>
                    <th>Muokkaa</th>
                    </tr>";


                    foreach ($result as $row) {
                        echo "<tr>";
                        echo "<td>" . $row['id'] . "</td>";
                        echo "<td>" . $row['name'] . "</td>";
                        echo "<td>" . $row['author'] . "</td>";
                        echo "<td>" . $row['price'] . "</td>";
                        echo "<td>" . $row['image'] . "</td>";
                        echo "<td>" . $row['category_id'] . "</td>";

                        $id = $row['id'];
                        $name = $row['name'];
                        $author = $row['author'];
                        $price = $row['price'];
                        $image = $row['image'];
                        $category_id = $row['category_id'];

                        echo "<td><a href='deletetuote.php?id=$id'>Delete</a></td>";

                        echo "<td><a href='updatetuote.php?id=$id&name=$name&author=$author&price=$price&image=$image&category_id=$category_id'>Update</a></td>";

                    }

                    echo "</table>";

                    
                }
                catch (PDOException $pdoex) {
                    returnError($pdoex);
                }

            ?>
        </div>
        <div id="asiakkaat">
            <h4>Asiakkaat</h4>
            <form action="saveasiakas.php" method="POST">
                <div>
                    <label>Asiakkaan nimi</label>
                    <input id="asnimi" name="asnimi" maxlength="50" type="text" required />
                </div>
                <div>
                    <label>Puhelinnumero</label>
                    <input id="puhelinro" name="puhelinro" maxlength="12" type="int"/>
                </div>
                <div>
                    <label>Osoite</label>
                    <input id="osoite" name="osoite" maxlength="50" type="text"/>
                </div>
                <div>
                    <label>Postitoimipaikka</label>
                    <input id="postitmp" name="postitmp" maxlength="35" type="text"/>
                </div>
                <div>
                    <label>Postinumero</label>
                    <input id="postinro" name="postinro" maxlength="5" type="text"/>
                </div>
                <div>
                    <label>Maa</label>
                    <input id="maa" name="maa" maxlength="30" type="text"/>
                </div>
                <div>
                    <label>Asiakkaaksitulovuosi</label>
                    <input id="asvuosi" name="asvuosi" maxlength="6" type="int"/>
                </div>
                <div>
                    <input type="submit" value="Lisää uusi asiakas"/>
                </div>
            </form>
            <?php 
                $host = "localhost";
                $database = "kirjakauppa";
                $user = "root";

                try {
                    $db = new PDO("mysql:host=$host;dbname=$database;chartset=utf8", $user, '');
                    $db->setAttribute(PDO::ATTR_ERRMODE,PDO::ERRMODE_EXCEPTION);
                    $lue = $db->prepare("SELECT * FROM asiakas");
                    $lue->execute();

                    $lue->setFetchMode(PDO::FETCH_ASSOC);

                    $result = $lue->fetchAll();

                    echo "<table border='1'>
                    <tr>
                    <th>Asiakastunnus</th>
                    <th>Asiakkaan nimi</th>
                    <th>Puhelinnumero</th>
                    <th>Osoite</th>
                    <th>Postitoimipaikka</th>
                    <th>Postinumero</th>
                    <th>Maa</th>
                    <th>Vuosi</th>
                    <th>Poista</th>
                    <th>Muokkaa</th>
                    </tr>";


                    foreach ($result as $row) {
                        echo "<tr>";
                        echo "<td>" . $row['astunnus'] . "</td>";
                        echo "<td>" . $row['asnimi'] . "</td>";
                        echo "<td>" . $row['puhelinro'] . "</td>";
                        echo "<td>" . $row['osoite'] . "</td>";
                        echo "<td>" . $row['postitmp'] . "</td>";
                        echo "<td>" . $row['postinro'] . "</td>";
                        echo "<td>" . $row['maa'] . "</td>";
                        echo "<td>" . $row['asvuosi'] . "</td>";

                        $astunnus = $row['astunnus'];
                        $asnimi = $row['asnimi'];
                        $puhelinro = $row['puhelinro'];
                        $osoite = $row['osoite'];
                        $postitmp = $row['postitmp'];
                        $postinro = $row['postinro'];
                        $maa = $row['maa'];
                        $asvuosi = $row['asvuosi'];

                        echo "<td><a href='deletetuote.php?astunnus=$astunnus'>Delete</a></td>";

                        echo "<td><a href='updatetuote.php?astunnus=$astunnus&asnimi=$asnimi&
                            puhelinro=$puhelinro&osoite=$osoite&postitmp=$postitmp&
                            postinro=$postinro&maa=$maa&asvuosi=$asvuosi";

                    }

                    echo "</table>";

                    
                }
                catch (PDOException $pdoex) {
                    returnError($pdoex);
                }

            ?>
        </div>
        <div id="tuoteryhmat">
            <h4>Tilaukset</h4>
            <form action="savetilaus.php" method="POST">
                <div>
                    <label>Tilauksen numero</label>
                    <input id="tilausnro" name="tilausnro" maxlength="11" type="int" required />
                </div>
                <div>
                    <label>Asiakastunnus</label>
                    <input id="astunnus" name="astunnus" maxlength="6" type="text" required />
                </div>
                <div>
                    <label>Tilauspäivä</label>
                    <input id="tilauspvm" name="tilauspvm" type="date" required />
                </div>
                <div>
                    <input type="submit" value="Lisää uusi tilaus"/>
                </div>
            </form>
            <?php 
                $host = "localhost";
                $database = "kirjakauppa";
                $user = "root";

                try {
                    $db = new PDO("mysql:host=$host;dbname=$database;chartset=utf8", $user, '');
                    $db->setAttribute(PDO::ATTR_ERRMODE,PDO::ERRMODE_EXCEPTION);
                    $lue = $db->prepare("SELECT * FROM tilaus");
                    $lue->execute();

                    $lue->setFetchMode(PDO::FETCH_ASSOC);

                    $result = $lue->fetchAll();

                    echo "<table border='1'>
                    <tr>
                    <th>Tilauksen numero</th>
                    <th>Asiakastunnus</th>
                    <th>Tilauspäivä</th>
                    <th>Poista</th>
                    <th>Muokkaa</th>
                    </tr>";


                    foreach ($result as $row) {
                        echo "<tr>";
                        echo "<td>" . $row['tilausnro'] . "</td>";
                        echo "<td>" . $row['astunnus'] . "</td>";
                        echo "<td>" . $row['tilauspvm'] . "</td>";

                        $tilausnro = $row['tilausnro'];
                        $astunnus = $row['astunnus'];
                        $tilauspvm = $row['tilauspvm'];

                        echo "<td><a href='deletetilaus.php?tilausnro=$tilausnro'>Delete</a></td>";

                        echo "<td><a href='updatetilaus.php?tilausnro=$tilausnro&astunnus=$astunnus&tilauspvm=$tilauspvm'>Update</a></td>";

                    }

                    echo "</table>";

                    
                }
                catch (PDOException $pdoex) {
                    returnError($pdoex);
                }

            ?>
        </div>
    </body>

</html>