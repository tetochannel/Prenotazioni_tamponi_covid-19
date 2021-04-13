<?php

include_once 'config.php';
require '../vendor/autoload.php';

use League\Plates\Engine;

if (!isset($_SESSION) || !$_SESSION['valid'])
{
    header("Location: ../");
    exit(0);
}

$templates = new Engine('../view', 'tpl');

$sql = "SELECT * FROM prenotazioni";

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