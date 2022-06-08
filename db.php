<?php

$dsn = "mysql:host=localhost;dbname=lab_1";
$user = "root";
$pass = "";

try {
    $dbh = new PDO($dsn, $user, $pass);

} catch (PDOException $eh) {
    echo $ex->GetMessage();
}

function findByLeague()
{
    global $dbh;
    try {
        $statement = $dbh->prepare("SELECT first.name as A, GAME.score, second.name as B
            FROM (GAME inner join TEAM AS first on GAME.FID_Team1 = first.ID_TEAM) 
            inner join TEAM AS second on GAME.FID_Team2 = second.ID_TEAM 
            WHERE first.league AND second.league = ?");
        $statement->execute([$_POST["league"]]);
        $str = "<table>";
        $str .= " <tr>
        <th> Team1  </th>
        <th> Score </th>
        <th> Team2 </th>
        </tr> ";
        while ($data = $statement->fetch()) {
            $str .= " <tr>
            <th> {$data['A']} </th>
            <th> {$data['score']} </th>
            <th> {$data['B']} </th>
            </tr> ";
        }
    $str .= "</table>";
    echo $str;
        
    } catch (PDOException $eh) {
        echo $ex->GetMessage();
    }
}



function findByDate()
{
    global $dbh;
    try {
        $statement = $dbh->prepare("SELECT GAME.date, GAME.place, GAME.score, first.name as A, second.name as B
            FROM (GAME inner join TEAM AS first on GAME.FID_Team1 = first.ID_TEAM) 
            inner join TEAM AS second on GAME.FID_Team2 = second.ID_TEAM 
            WHERE GAME.date BETWEEN :first AND :second");
            
        $statement->execute(array('first' => $_POST["first_date"], 'second' => $_POST["second_date"]));
        $str = "<table>";
        $str .= " <tr>
        <th> Date  </th>
        <th> Place </th>
        <th> Score </th>
        <th> Team1 </th>
        <th> Team2 </th>
        </tr> ";
        while ($data = $statement->fetch()) {
            $str .=  " <tr>
            <th> {$data['date']}  </th>
            <th> {$data['place']} </th>
            <th> {$data['score']} </th>
            <th> {$data['A']} </th>
            <th> {$data['B']} </th>
            </tr> ";
        }
        $str .=  "</table>";
        echo $str;
    } catch (PDOException $eh) {
        echo $ex->GetMessage();
    }
}


function findByName()
{
    global $dbh;
    
    try {
        $statement = $dbh->prepare("SELECT GAME.date, GAME.place, GAME.score, first.name as A, second.name as B
        FROM (GAME inner join TEAM AS first on GAME.FID_Team1 = first.ID_TEAM) 
        inner join TEAM AS second on GAME.FID_Team2 = second.ID_TEAM 
        WHERE GAME.ID_Game IN 
            (SELECT GAME.ID_Game FROM GAME WHERE 
            (SELECT FID_TEAM FROM PLAYER WHERE ID_Player = ?) IN (FID_TEAM1, FID_TEAM2))");
        $statement->execute([$_POST["name"]]);
        $str = "<table>";
        $str .= " <tr>
        <th> Date  </th>
        <th> Place </th>
        <th> Score </th>
        <th> Team1 </th>
        <th> Team2 </th>
        </tr> ";
        while ($data = $statement->fetch()) {
            $str .= " <tr>
            <th> {$data['date']}  </th>
            <th> {$data['place']} </th>
            <th> {$data['score']} </th>
            <th> {$data['A']} </th>
            <th> {$data['B']} </th>
            </tr> ";
        }
        $str .= "</table>";
        echo json_encode($str);
    } catch (PDOException $eh) {
        echo $ex->GetMessage();
    }
}

if (isset($_POST["league"])) {
    findByLeague();
} elseif (isset($_POST["first_date"])) {
    findByDate();
}elseif (isset($_POST["name"])) {
    findByName();
}