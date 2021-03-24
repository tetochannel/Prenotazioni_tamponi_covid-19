<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Prenotazioni tampone Covid-19</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/mini.css/3.0.1/mini-default.min.css">
</head>
<body>
    <h2> Prenotazione riuscita </h2>
    <h1><strong>Data: <?php echo $giorno;?></strong></h1>
    <h3> Questo è il tuo codice prenotazione che dovrai esibire quando ti presenterai alla visita </h3>
    <img src="../src/qr_code_generator.php?uid=<?php echo $uid;?>"/>
    <h1><strong><?php echo $uid; ?></strong></h1>
    <h4><i>NB: Salvatelo perché altrimenti non potrai fare la visita senza</i></h4>
    <input onclick="window.location.href='/Prenotazioni_tampone_Covid-19'" type="submit" value="Torna indietro"/>
    <input onclick="window.print()" type="submit" value="Stampa"/>
    <h2>Lista prenotazioni</h2>
    <table>
        <tr>
            <th>Codice Fiscale</th>
            <th>Codice prenotazione</th>
            <th>Data</th>
        </tr>
        <?php foreach($result as $row): ?>
            <tr>
                <td><?php echo $row['codice_fiscale']; ?></td>
                <td><?php echo $row['uid']; ?></td>
                <td><?php echo date('d/m/Y', strtotime($row['giorno'])); ?></td>
            </tr>
        <?php endforeach ?>
    </table>
</body>
</html>
