<?php

// Esempio di file di configurazione

$host = ':your_host';
$dbname = ':your_database';

$user = ':your_uer';
$password = ':your_password';

$dsn = 'mysql:host='.$host.';dbname='.$dbname;

$pdo = new PDO($dsn, $user, $password);
