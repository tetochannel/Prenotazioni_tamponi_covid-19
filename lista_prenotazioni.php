<?php

include_once 'config.php';

$sql = "SELECT * FROM `prenotazioni_tampone_covid-19`.prenotazioni";

$stmt = $pdo->query($sql);

//Decisione "Sporca" {
echo '<pre>';
echo var_dump($stmt->fetchAll());
echo '</pre>';
// }