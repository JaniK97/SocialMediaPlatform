<?php
ob_start(); //turns on output buffering
session_start();
// luo yhteyden tietokantaan
$timezone = date_default_timezone_set("Europe/Helsinki");

$con = mysqli_connect("localhost", "root", "", "social"); // käyttäjän tiedot

if(mysqli_connect_errno()){
    echo "failed to connect: " . mysqli_connect_errno();
}
?>