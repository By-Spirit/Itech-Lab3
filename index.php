<?php
require_once __DIR__ . "/db.php"
?>

<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Document</title>
    <script src="script.js"></script>
</head>
<body>
<label for="name">Таблица чемпионата выбранной лиги</label>
    <form action="" method="post" id="league">
        <input type="number" name="league" value = 1 min = 1 max = 3>
        <input type="submit" value="Найти"><br>
    </form>
    <br>

    <label for="name">Список игр на указанный временной интервал</label>
    <form action="" method="post" id="first_date">
        <input type="date" name="first_date">
        <input type="date" name="second_date">
        <input type="submit" value="Найти"><br>
    </form>
<br>

<label for="name">Список игр выбранного футболиста</label>
<form action="db.php" method="post" id="name">
    <?php
    $dbh = new PDO("mysql:host=localhost;dbname=lab_1", "root", "");
    $statement = $dbh->prepare("SELECT * FROM `player`");
    $statement->execute();
  
        echo "<select name = 'name'>";
        echo "<option value='0'>Выбор</option>";
            while($data = $statement->fetch()){
                echo $data->name;
        echo "<option value = {$data['ID_Player']} > {$data['name']} </option>";}
        echo "</select>";
    ?>
    <input type="submit" value="Найти"><br>
</form>
<br>
<div id="text">

</div>
</body>
</html>