<?php

include_once 'config.php';
require '../vendor/autoload.php';
use League\Plates\Engine;

if (!isset($_SESSION) || !$_SESSION['valid'])
{
    header("Location: ../login.html");
    exit(0);
}

$templates = new Engine('../view', 'tpl');

$data_inizio = $_POST['inizio'];
$data_fine = $_POST['fine'];

$sql = "select giorno, count(*) as numero_prenotazioni from prenotazioni 
where giorno between :data_inizio and :data_fine group by giorno order by giorno";

$stmt = $pdo->prepare($sql);

$stmt->execute(
    [
        'data_inizio' => $data_inizio,
        'data_fine' => $data_fine
    ]
);

$result = $stmt->fetchAll(/*PDO::FETCH_ASSOC*/);

if (count($result) == 0)
{
    echo 'Nessuna prenotazione';
    exit(0);
}

$prenotazioni = array();
$date = array();

foreach ($result as $row) {
    $prenotazioni[] = $row['numero_prenotazioni'];
    $date[] = $row['giorno'];
}

echo $templates->render('statistiche_prenotazioni', ['result' => $result, 'data_inizio' => $data_inizio, 'data_fine' => $data_fine, 'prenotazioni' => $prenotazioni, 'date' => $date]);