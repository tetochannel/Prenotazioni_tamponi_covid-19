<?= $this->layout('main', ['title' => 'Prenotazione riuscita'])?>
<h2>Riepilogo</h2>
<h1><strong>Data: <?= $giorno?></strong></h1>
<h3> Questo è il tuo codice prenotazione che dovrai esibire quando ti presenterai alla visita </h3>
<img src="../src/qr_code.php?uid=<?= $uid?>"/>
<h1><strong><?= $uid ?></strong></h1>
<h4><i>NB: Salvatelo perché altrimenti non potrai fare la visita senza</i></h4>
<input onclick="window.location.href='/Prenotazioni_tampone_Covid-19'" type="submit" value="Torna indietro"/>
<input onclick="window.print()" type="submit" value="Stampa"/>