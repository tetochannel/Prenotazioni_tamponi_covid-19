<?= $this->layout('main', ['title' => 'Statistiche'])?>
<div style="display: flex; align-items: center">
    <canvas id="chart" width="600"></canvas>
    <table>
        <tr>
            <th>Data</th>
            <th>Numero prenotazioni</th>
        </tr>
        <?php foreach($result as $row): ?>
        <tr>
            <td><?= date('d/m/Y', strtotime($row['giorno'])) ?></td>
            <td><?= $row['numero_prenotazioni'] ?></td>
        </tr>
        <?php endforeach ?>
    </table>
</div>
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

