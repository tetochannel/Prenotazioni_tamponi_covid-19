<?php

include_once 'config.php';
require '../vendor/autoload.php';

use League\Plates\Engine;

if (!isset($_POST['username'], $_POST['password'])) {
    header("Location: ../");
    exit(0);
}

$username = $_POST['username'];

$sql = "select username from utenti where username = :username";

$stmt = $pdo->prepare($sql);

$stmt->execute(
    [
        'username' => $username
    ]
);

$result = $stmt->fetch();

$templates = new Engine('../view', 'tpl');

if ($result)
    echo $templates->render('esito_registrazione', ['esito' => 'Registrazione effettuata con successo']);
else
    echo $templates->render('esito_registrazione', ['esito' => 'Si è verificato un errore durante la registrazione']);
