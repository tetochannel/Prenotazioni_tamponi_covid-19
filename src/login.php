<?php

include_once 'config.php';

if (!isset($_POST['username'], $_POST['password'])) {
    header("Location: ../");
    exit(0);
}

$username = $_POST['username'];
$password = $_POST['password'];


$sql = "select * from utenti where username = :username";

$stmt = $pdo->prepare($sql);

$stmt->execute(
    [
        'username' => $username
    ]
);

$result = $stmt->fetch();

if (!$result || !password_verify($password, $result['passowrd']))
{
    http_response_code(403);
    echo "Credenziali errate";
    exit(0);
}

$_SESSION['username'] = $username;



