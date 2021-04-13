<?php

include_once 'config.php';

$username = $_POST['username'];
$password1 = $_POST['password1'];
$password2 = $_POST['password2'];

http_response_code(403);

if (!isset($_POST['username'], $_POST['password1'], $_POST['password2'])) {
    header("Location: ../");
    exit(0);
}

if ($password1 != $password2)
{
    http_response_code(403);
    echo "Le password non coincidono";
    exit(0);
}

$sql = "select username from utenti where username = :username";

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

$sql="insert into utenti (username, password) values (:username, :password)";

$stmt = $pdo->prepare($sql);

$stmt->execute(
    [
        'username' => $username,
        'password' => password_hash($password1, PASSWORD_DEFAULT)
    ]
);

