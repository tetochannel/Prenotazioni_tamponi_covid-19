<?php

include_once 'config.php';
require '../vendor/autoload.php';
use League\Plates\Engine;

$templates = new Engine('../view', 'tpl');

$data_inizio = $_POST['inizio'];
$data_fine = $_POST['fine'];

$sql = "select giorno, count(*) as numero_prenotazioni from `prenotazioni_tampone_covid-19`.prenotazioni 
where giorno between :data_inizio and :data_fine group by giorno order by giorno";

$stmt = $pdo->prepare($sql);

$stmt->execute(
    [
        'data_inizio' => $data_inizio,
        'data_fine' => $data_fine
    ]
);

session_start();
$_SESSION['result'] = $result = $stmt->fetchAll(/*PDO::FETCH_ASSOC*/);

if (count($result) == 0)
{
    echo 'Nessuna prenotazione';
    exit(0);
}

echo $templates->render('riepilogo', ['result' => $result, 'data_inizio' => $data_inizio, 'data_fine' => $data_fine]);