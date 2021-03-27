<?php

include_once 'config.php';
require '../vendor/autoload.php';
use League\Plates\Engine;

$templates = new Engine('../view', 'tpl');

$stmt = $pdo->query('SELECT codice_fiscale, uid from `prenotazioni_tampone_covid-19`.prenotazioni 
where giorno = CURRENT_DATE()');

$result = $stmt->fetchAll();

echo $templates->render('odierne', ['result' => $result, 'date' => date('d/m/Y')]);
exit(0);