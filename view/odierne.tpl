<?= $this->layout('main', ['title' => "Prenotazioni ($date)"])?>
<table>
    <tr>
        <th>Codice Fiscale</th>
        <th>Codice prenotazione</th>
    </tr>
    <?php foreach($result as $row): ?>
    <tr>
        <td><?= $row['codice_fiscale'] ?></td>
        <td><?= $row['uid'] ?></td>
    </tr>
    <?php endforeach ?>
</table>
<input onclick="window.location.href='/Prenotazioni_tampone_Covid-19'" type="submit" value="Menu"/>