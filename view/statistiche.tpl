<?= $this->layout('main', ['title' => 'Statistiche sulle prenotazioni'])?>
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
<input onclick="window.location.href='/Prenotazioni_tampone_Covid-19'" type="submit" value="Menu"/>
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.5.0/Chart.js"></script>
<script>
    const prenotazioni = <?= json_encode($prenotazioni) ?>;
    const date = <?= json_encode($date) ?>;

    new Chart(document.getElementById('chart'), {
    type: 'bar',
    data: {
        labels: date,
        datasets: [{
            label: 'Prenotazioni',
            data: prenotazioni,
            borderWidth: 1
        }]
    },
    options: {
        responsive: false,
        legend: { display: true },
        scales: {
            yAxes: [{
                ticks: {
                    beginAtZero: true,
                    stepSize: 1
                }
            }]
        }
    }
})

</script>

