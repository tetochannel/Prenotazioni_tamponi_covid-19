<?php

include_once 'config.php';
require '../vendor/autoload.php';

use League\Plates\Engine;

$templates = new Engine('../view', 'tpl');

$sql = "SELECT * FROM `prenotazioni_tampone_covid-19`.prenotazioni";

$stmt = $pdo->query($sql);

$result = $stmt->fetchAll();

//Decisione "Sporca" {
//echo '<pre>';
//echo var_dump($stmt->fetchAll());
//echo '</pre>';
// }

if (count($result) == 0)
{
    echo 'Nessuna prenotazione';
    exit(0);
}

echo $templates->render('prenotazioni_totali', ['result' => $result]);