<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Prenotazioni tampone Covid-19</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/mini.css/3.0.1/mini-default.min.css">
</head>
<body>
<h2>Lista prenotazioni odierne</h2>
<table>
    <tr>
        <th>Codice Fiscale</th>
        <th>Codice prenotazione</th>
    </tr>
    <?php foreach($result as $row): ?>
    <tr>
        <td><?php echo $row['codice_fiscale']; ?></td>
        <td><?php echo $row['uuid']; ?></td>
    </tr>
    <?php endforeach ?>
</table>
</body>
</html>
