<?php
include("../../config/config.php");
include("../classes/User.php");
include("../classes/Notification.php");

$limit = 7; //ladattavien ilmoitusten lukumäärä

$notification = new Notification($con, $_REQUEST['userLoggedIn']);
echo $notification->getNotifications($_REQUEST, $limit);

?>