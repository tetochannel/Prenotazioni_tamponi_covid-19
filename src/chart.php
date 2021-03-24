<?php
?>

<script>
const prenotazioni = <?php echo json_encode($prenotazioni); ?>;
const date = <?php echo json_encode($date); ?>;

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