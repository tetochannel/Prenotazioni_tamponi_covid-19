<!DOCTYPE html>
<html lang="it">
<head>
    <meta charset="UTF-8">
    <title>Prenotazione tamponi Covid-19</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/mini.css/3.0.1/mini-default.min.css">
</head>
<body>
    <h1><strong><?= $title ?></strong></h1>
    <?= $this->section('content') ?>
    <input onclick="window.location.href='/Prenotazioni_tampone_Covid-19'" type="button" value="Menu"/>
</body>
</html>