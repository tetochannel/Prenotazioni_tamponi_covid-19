<?php

require 'vendor/phpqrcode.php';
                    //sicura
$qr = QRcode::png($_GET['uuid']);