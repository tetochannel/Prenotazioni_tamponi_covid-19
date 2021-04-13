<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Prenotazione</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/mini.css/3.0.1/mini-default.min.css">
    <link rel="stylesheet" href="https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/themes/smoothness/jquery-ui.css">
    <style>
        .max{
            background: #f00 !important;
        }
    </style>
</head>
<body>
<h1><strong>Nuova prenotazione</strong></h1>
<form action="src/nuova_prenotazione.php" method="post">
    <fieldset>
        <legend>Inserisci le seguenti informazioni per prendere un appuntamento</legend>
        <label for="codice_fiscale">Codice Fiscale</label>
        <input type="text" id="codice_fiscale" placeholder="RSSFLV95C12H118C" name="codice_fiscale" required/>
        <label for="data">Data</label>
        <input type="text" id="data" name="giorno" required autocomplete="off" onpaste="return false" ondrop="return false"/>
        <input type="submit" value="Invia richiesta">
    </fieldset>
</form>
<input onclick="window.location.href='/Prenotazioni_tampone_Covid-19'" type="button" value="Menu"/>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js"></script>
<script>
    const days = <?php
        include_once 'src/config.php';
        $stmt = $pdo->query('select giorno from `prenotazioni_tampone_covid-19`.prenotazioni where giorno between current_date() and date_add(current_date(), interval 7 day) group by giorno having count(*) >= 5');
        $result = $stmt->fetchAll();
        $dates = array();
        foreach ($result as $row)
            $dates[] = $row['giorno'];
        echo json_encode($dates);
    ?>;
    $(function() {
        $("#data").keydown(function (event) {
            event.preventDefault();
        });
        const today = new Date();
        const max = new Date(today);
        max.setDate(max.getDate() + 7)
        $("#data").datepicker({
            minDate: today,
            maxDate: max,
            beforeShowDay: (date) => {
                if (days.includes(date.getFullYear().toString().padStart(2, "0") + "-" + String(date.getMonth() + 1).padStart(2, "0") + "-" + date.getDate().toString().padStart(2, "0")))
                    return [ false, "max", "Numero massimo di prenotazioni raggiunto per questo giorno" ]
                else
                    return [ true, "", "" ]
            }
        })
    })
</script>
</body>
</html>
