<?php

include_once 'config.php';

$username = $_POST['username'];
$password1 = $_POST['password1'];
$password2 = $_POST['password2'];

if ($password1 != $password2)
{
    http_response_code(403);
    echo "Le password non coincidono";
    exit(0);
}

$sql = "select username from `prenotazioni_tampone_covid-19`.utenti where username = :username";

$stmt = $pdo->prepare($sql);

$stmt->execute(
    [
        'username' => $username
    ]
);

$result = $stmt->fetch();

if ($result)
{
    http_response_code(403);
    echo "Utente già registrato";
    exit(0);
}

$sql="insert into `prenotazioni_tampone_covid-19`.utenti (username, password) values (:username, :password)";

$stmt = $pdo->prepare($sql);

$stmt->execute(
    [
        'username' => $username,
        'password' => password_hash($password1, PASSWORD_DEFAULT)
    ]
);

