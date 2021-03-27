<?php

include_once 'config.php';
require '../vendor/autoload.php';
use League\Plates\Engine;

$giorno = $_POST['giorno'];
$codice_fiscale = $_POST['codice_fiscale'];

$sql = 'select count(*) as numero_prenotazioni, giorno from `prenotazioni_tampone_covid-19`.prenotazioni group by giorno having giorno = :giorno';

$stmt = $pdo->prepare($sql);

$stmt->execute(
    [
        'giorno' => $giorno
    ]
);

$result = $stmt->fetchAll();

$templates = new Engine('../view', 'tpl');

if ($result[0]['numero_prenotazioni'] >= PRENOTAZIONI_MASSIME)
{
    echo $templates->render('massimo', ['giorno' => date('d/m/Y', strtotime($result[0]['giorno']))]);
    exit(0);
}

$codice = hash('sha3-224', $codice_fiscale.'-'.time());
                                                                                                // Sono i segna posto, posso avere lo stesso nome delle variabili che rappresentano ma NON fanno riferimento alla stessa cosa (non sono la stessa cosa)
$sql = "INSERT INTO `prenotazioni_tampone_covid-19`.prenotazioni (codice_fiscale, giorno, uid) values (:codice_fiscale, :giorno, :codice)";

// Con questa istruzione viene inviata la query al database che però non esegue subito ma la memorizza, aspettando che venga richiesto di eseguirla tramite il richiamo della funzione execute
$stmt = $pdo->prepare($sql);

// Inviamo i dati al database che verranno sostituiti ai segna posto della query in modo tale che gestisca lui le protezioni da eventali attacchi di sql injection

$stmt->execute(
    [
        'codice_fiscale' => $codice_fiscale,
        'giorno' => $giorno,
        'codice' => $codice
    ]
);

// echo '<h1>Prenotazione effettuata con successo</h1>';

// In generale il deployment è il processo per cui si configura/installa/monta (es. infrastrutture di macchine)/fornisce
// il risultato finale al cliente se per esempio
// ci ha richiesto un software oppure mettendolo sul server se abbiamo realizzato un back end in php come in questo caso
// Essendo che il sever lo proproniamo in locale grazie ad apache (XAMPP), il processo di deployment farà in modo di
// fare una copia distinta nella root del server (che in questo caso è sempre appunto locale C:/xampp/htdocs;
// Nella realtà sarebbe ovviamente sul server). In questo esempio, con questi strumenti e queste configurazioni,
// bisognerà fare il deployment ogni volta per poter applicare delle modifiche fatte su questo file
// Per configurare questo processo basta andare in Tools/Deployment/Configuration


//Simulazione richieste post: Tools/Http Client/Test RESTful Web Service

//Decisione "Sporca" {
//Sovrascrive l'header del pacchhetto di risposta del server reindirizzando il client alla pagina indicata nella location
//header("location: prenotazioni.php?uid=$codice&giorno=$giorno");
//}
echo $templates->render('riepilogo', ['giorno' => date('d/m/Y', strtotime($result[0]['giorno'])), 'uid' => $codice]);