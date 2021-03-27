<?php
?>

<script>
const prenotazioni = <?php echo json_encode($prenotazioni); ?>;
const date = <?php echo json_encode($date); ?>;
//const days = getDays(data_inizio, data_fine);

/*function getDays(start, end) {
    let days = []
    for (let d = new Date(start); d <= new Date(end); d.setDate(d.getDate() + 1))
        days.push(`${d.getDate().toString().padStart(2, "0")}/${String(d.getMonth() + 1).padStart(2, "0")}/${d.getFullYear().toString().padStart(2, "0")}`)
    return days
}

function fillPrenotaizioni() {
    let newPrenotazioni = [];
    days.forEach((day, i) => {
        newPrenotazioni.push()
    })
}*/

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