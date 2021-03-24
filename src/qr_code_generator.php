<?php

require '../vendor/phpqrcode/phpqrcode.php';
                    //sicura
$qr = QRcode::png($_GET['uid']);