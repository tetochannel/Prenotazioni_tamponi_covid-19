<?= $this->layout('main', ['title' => 'Prenotazione non riuscita'])?>
<h2>Il numero massimo di prenotazioni per il giorno <?= $giorno?> è stato raggiunto</h2>
<h3><i>Si prega di selezionare un'altra data</i></h3>
<input onclick="window.location.href='/Prenotazioni_tampone_Covid-19'" type="submit" value="Torna indietro"/>
