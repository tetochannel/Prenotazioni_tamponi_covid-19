<?php

include_once 'config.php';

$codice_fiscale = $_POST['codice_fiscale'];
$codice_prenotazione = $_POST['codice_prenotazione'];

if (!isset($_SESSION) || !$_SESSION['valid'])
{
    header("Location: ../");
    exit(0);
}

$sql = 'select codice_fiscale, uid, annullata from `prenotazioni_tampone_covid-19`.prenotazioni where codice_fiscale = :codice_fiscale 
                                                                        and uid = :codice_prenotazione';

$stmt = $pdo->prepare($sql);

$stmt->execute(
    [
        'codice_fiscale' => "$codice_fiscale",
        'codice_prenotazione' => "$codice_prenotazione"
    ]
);

$result = $stmt->fetchAll(PDO::FETCH_ASSOC);

if (empty($result) && $result['annullata'] == 1)
{
    echo 'Prenotazione non trovata';
    exit(0);
}

$sql = 'update `prenotazioni_tampone_covid-19`.prenotazioni set annullata = 1 where codice_fiscale = :codice_fiscale 
                                                                        and uid = :codice_prenotazione';

$stmt = $pdo->prepare($sql);

$stmt->execute(
    [
        'codice_fiscale' => "$codice_fiscale",
        'codice_prenotazione' => "$codice_prenotazione"
    ]
);

echo 'Prenotazione eliminata';