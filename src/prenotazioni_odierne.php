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

$stmt = $pdo->query('SELECT codice_fiscale, uid from prenotazioni 
where giorno = CURRENT_DATE()');

$result = $stmt->fetchAll();

echo $templates->render('prenotazioni_odierne', ['result' => $result, 'date' => date('d/m/Y')]);
exit(0);