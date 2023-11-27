<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
</head>
<title>User Profile</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
<link rel="stylesheet" href="mystyle.css">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.min.js" integrity="sha384-cuYeSxntonz0PPNlHhBs68uyIAVpIIOZZ5JqeqvYYIcEL727kskC66kF92t6Xl2V" crossorigin="anonymous"></script>

<?php
function Conn($sql)
{
  $res = null;
  $link = new mysqli('localhost', 'root', '', 'test1'); //change to your db accordingly // last field is database
  if ($link->connect_error) { // see if link sucessful
    switch ($link->connect_error) {
      case 1045:
        echo "Connection declined, check passowrd";
        break;
      case 1049:
        echo "Check db name";
        break;
      default:
        break;
    }
  } else {
    $link->query("SET NAMES utf8"); //set char set
    $res = $link->query($sql); //res is inside this function, increasing the visiblity
  }

  mysqli_close($link);

  return $res;
}

?>

<body>
  <div>
    <h1>User page</h1>
    <a href="index.php">Home</a>
    <?php
    //Beginning the session.
    //https://www.w3docs.com/snippets/php/how-to-expire-a-php-session.html
    session_start();

    //Expiring the session in case the user is inactive for 30
    //minutes or more.
    $expireAfter = 30;

    //Test to make sure if our "last action" session
    //variable was set.
    if (isset($_SESSION['last_action'])) {
      //Find out how many seconds have already passed
      //since the user was active last time.
      $secondsInactive = time() - $_SESSION['last_action'];

      //Converting the minutes into seconds.
      $expireAfterSeconds = $expireAfter * 60;

      //Test to make sure if they have not been active for too long.
      if ($secondsInactive >= $expireAfterSeconds) {
        // The user has not been active for too long.
        //Killing the session.
        session_unset();
        session_destroy();
      }
    }

    //Assigning the current timestamp as the user's
    // the latest action
    

    //get values
    $_SESSION['last_action'] = time();
    if (isset($_SESSION['userName'])) {
      echo "<h3>Welcome：" . $_SESSION['userName'] . "</h3>";
      //echo "<a href=" . 'user.php' .">User portal</a>";
    } else {
      //echo "<br>";
    }
    
    
    ?>

    <?php

    //This function log out the user by destroying the session

    if (isset($_POST['buttonKillSession'])) {
      session_unset();
      session_destroy();

      echo "You have been logged out";

      //sends user back to homepage when logout
      header('Location: http://localhost/advancedweb/index.php');
      die();
    }

    ?>

    <form method="post">
      <input type="submit" name="buttonKillSession" value="Log Out" />
    </form>


  </div>

</body>

</html>