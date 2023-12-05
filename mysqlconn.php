<?php

// $link = new mysqli('localhost','root','','test');
// // var_dump($link);

// if($link->connect_error){
//  switch($link->connect_error){
//      case 1045 : echo " Connection declined, check passowrd";
//      break;
//      case 1049 : echo " Check db name";
//      break;
//      default:break;
//   }        
// }else{

//   echo "connection success " . date("h:i:sa");
//   $link->query("SET NAMES utf8");

//   //close connection
//   mysqli_close($link);
// }

function Conn($sql)
{
  $res = null;
  $link = new mysqli('localhost', 'root', '', 'movie'); // change to your db accordingly // last field is database
  if ($link->connect_error) { // see if link sucessful
    switch ($link->connect_error) {
      case 1045:
        echo 'Connection declined, check passowrd';
        break;
      case 1049:
        echo 'Check db name';
        break;
      default:
        break;
    }
  } else {
    $link->query('SET NAMES utf8'); // set char set
    $res = $link->query($sql); // res is inside this function, increasing the visiblity
  }

  mysqli_close($link);

  return $res;
}
