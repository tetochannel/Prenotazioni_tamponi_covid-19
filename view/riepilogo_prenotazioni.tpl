<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Prenotazioni tampone Covid-19</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/mini.css/3.0.1/mini-default.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.9.4/Chart.min.css" integrity="sha512-/zs32ZEJh+/EO2N1b0PEdoA10JkdC3zJ8L5FTiQu82LR9S/rOQNfQN7U59U9BC12swNeRAz3HSzIL2vpp4fv3w==" crossorigin="anonymous" />
</head>
<body>
<canvas id="chart" width="800" height="600"></canvas>
<table>
    <tr>
        <th>Data</th>
        <th>Numero prenotazioni</th>
    </tr>
    <?php foreach($result as $row): ?>
    <tr>
        <td><?php echo date('d/m/Y', strtotime($row['giorno'])); ?></td>
        <td><?php echo $row['numero_prenotazioni']; ?></td>
    </tr>
    <?php endforeach ?>
</table>
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.5.0/Chart.js"></script>
<?php

$prenotazioni = array();
$date = array();

foreach ($result as $row) {
    $prenotazioni[] = $row['numero_prenotazioni'];
    $date[] = $row['giorno'];
}

include '../src/chart.php';

?>
</body>
</html>

