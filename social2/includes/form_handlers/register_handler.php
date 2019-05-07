<?php
//Muuttujien ilmoittaminen virheiden estämiseksi
$fname = ""; //Etunimi
$lname = ""; //Sukunimi
$em = ""; //sähköposti
$em2 = ""; //sähköposti 2
$password = ""; //salasana
$password2 = ""; //salasana 2
$date = ""; //rekisteröitymis päivä
$error_array = array(); //sisältää error viestit

if(isset($_POST['register_button'])){

  //rekisteröinnin lomakkeen arvot

  //Etunimi
  $fname = strip_tags($_POST['reg_fname']); //Poistaa html tagit
  $fname = str_replace(' ', '', $fname); //Poistaa välit
  $fname = ucfirst(strtolower($fname)); //Ekakirjain isolla
  $_SESSION['reg_fname'] = $fname; //Tallentaa etunimin istunnon muuttujaan

  //Sukunimi
  $lname = strip_tags($_POST['reg_lname']); //Poistaa html tagit
  $lname = str_replace(' ', '', $lname); //poistaa välit
  $lname = ucfirst(strtolower($lname)); //Ekakirjain isolla
  $_SESSION['reg_lname'] = $lname; //Tallentaa sukunimen istunnon muuttujaan

  //sähköposti
  $em = strip_tags($_POST['reg_email']); //Poistaa html tagit
  $em = str_replace(' ', '', $em); //poistaa välit
  $em = ucfirst(strtolower($em)); //Ekakirjain isolla
  $_SESSION['reg_email'] = $em; //Tallentaa sähköpostin istunnon muuttujaan

  //sähköposti 2
  $em2 = strip_tags($_POST['reg_email2']); //Poistaa html tagit
  $em2 = str_replace(' ', '', $em2); //Poistaa välit
  $em2 = ucfirst(strtolower($em2)); //Ekakirjain isolla
  $_SESSION['reg_email2'] = $em2; //Tallentaa sähköpostin istunnon muuttujaan

  //Salasana
  $password = strip_tags($_POST['reg_password']); //Poistaa html tagit
  $password2 = strip_tags($_POST['reg_password2']); //Poistaa html tagit

  $date = date("Y-m-d"); //Tämän hetkinen päivämäärä

  if($em == $em2) {
    //Tarkistaa onko sähköposti kelvollisessa muodossa
    if(filter_var($em, FILTER_VALIDATE_EMAIL)) {

      $em = filter_var($em, FILTER_VALIDATE_EMAIL);

      //Tarkistaa onko sähköposti osoite jo käytössä
      $e_check = mysqli_query($con, "SELECT email FROM users WHERE email='$em'");

      //Laskee palautettujen rivin lukumäärä
      $num_rows = mysqli_num_rows($e_check);

      if($num_rows > 0) {
        array_push($error_array, "Email already in use<br>");
      }

    }
    else {
      array_push($error_array, "Invalid email format<br>");
    }


  }
  else {
    array_push($error_array, "Emails don't match<br>");
  }


  if(strlen($fname) > 25 || strlen($fname) < 2) {
    array_push($error_array, "Your first name must be between 2 and 25 characters<br>");
  }

  if(strlen($lname) > 25 || strlen($lname) < 2) {
    array_push($error_array,  "Your last name must be between 2 and 25 characters<br>");
  }

  if($password != $password2) {
    array_push($error_array,  "Your passwords do not match<br>");
  }
  else {
    if(preg_match('/[^A-Za-z0-9]/', $password)) {
      array_push($error_array, "Your password can only contain english characters or numbers<br>");
    }
  }

  if(strlen($password > 30 || strlen($password) < 5)) {
    array_push($error_array, "Your password must be betwen 5 and 30 characters<br>");
  }


  if(empty($error_array)) {
    $password = md5($password); //Kryptaa salasanan enne sen tallentamista tietokantaan

    //Luo käyttäjänimen etunimen ja sukunimen perusteella
    $username = strtolower($fname . "_" . $lname);
    $check_username_query = mysqli_query($con, "SELECT username FROM users WHERE username='$username'");


    $i = 0; 
    //jos käyttäjänimi on jo olemassa lisää uuden perään numeron...
    while(mysqli_num_rows($check_username_query) != 0) {
      $i++; //Add 1 to i
      $username = $username . "_" . $i;
      $check_username_query = mysqli_query($con, "SELECT username FROM users WHERE username='$username'");
    }

    //profiilikuvan arvonta
    $rand = rand(1, 2); //satunnainen numero väliltä 1-2

    if($rand == 1)
      $profile_pic = "assets/images/profile_pics/defaults/head_deep_blue.png";
    else if($rand == 2)
      $profile_pic = "assets/images/profile_pics/defaults/head_emerald.png";


    $query = mysqli_query($con, "INSERT INTO users VALUES ('', '$fname', '$lname', '$username', '$em', '$password', '$date', '$profile_pic', '0', '0', 'no', ',')");

    array_push($error_array, "<span style='color: #14C800;'>You're all set! Go ahead and login!</span><br>");

    //Pyyhkii istunnon tiedot
    $_SESSION['reg_fname'] = "";
    $_SESSION['reg_lname'] = "";
    $_SESSION['reg_email'] = "";
    $_SESSION['reg_email2'] = "";
  }

}
?>