<?= $this->layout('main', ['title' => 'Prenotazioni'])?>
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
