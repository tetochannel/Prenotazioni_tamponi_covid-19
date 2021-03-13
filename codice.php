<?php

session_start();

echo '<h2> Prenotazione riuscita </h2>';
echo '<h3> Questo è il tuo codice prenotazione che dovrai esibire quando ti presenterai alla visita </h3>';
echo '<h1><strong>', $_SESSION['uuid'], '</strong></h1>';
echo '<h4> NB: Salvatelo perché altrimenti non potrai fare la visita senza </h4>';
echo '<form action="/prenotazioni_tampone_Covid-19/"><input type="submit" value="Torna indietro"/></form>';

session_abort();
exit(0);