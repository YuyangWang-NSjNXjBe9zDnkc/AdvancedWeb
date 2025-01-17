<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
</head>
<title>Homepage</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
<link rel="stylesheet" href="mystyle.css">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.min.js" integrity="sha384-cuYeSxntonz0PPNlHhBs68uyIAVpIIOZZ5JqeqvYYIcEL727kskC66kF92t6Xl2V" crossorigin="anonymous"></script>

<?php
include 'mysqlconn.php'; 
?>



<body>
    <div class='container-fluid my-5 align-content-start'>
        <h1>MovieRater</h1>

        <a href="login.php">Login</a>
        <?php
        // Beginning the session.
        // https://www.w3docs.com/snippets/php/how-to-expire-a-php-session.html
        session_start();

        // Expiring the session in case the user is inactive for 30
        // minutes or more.
        $expireAfter = 30;

        // Test to make sure if our "last action" session
        // variable was set.
        if (isset($_SESSION['last_action'])) {
            // Find out how many seconds have already passed
            // since the user was active last time.
            $secondsInactive = time() - $_SESSION['last_action'];

            // Converting the minutes into seconds.
            $expireAfterSeconds = $expireAfter * 60;

            // Test to make sure if they have not been active for too long.
            if ($secondsInactive >= $expireAfterSeconds) {
                // The user has not been active for too long.
                // Killing the session.
                session_unset();
                session_destroy();
            }
        }

        // Assigning the current timestamp as the user's
        // the latest action

        $_SESSION['last_action'] = time();
        if (isset($_SESSION['userName'])) {
            echo '<h3>Welcome：' . $_SESSION['userName'] . '</h3>';

            echo '<a href=user.php>User portal</a>';
            echo '<form method=post><input type=submit name=buttonKillSession value=Logout /></form>';
        } else {
            // echo "<br>";
        }

        ?>



        <?php

        // This function log out the user by destroying the session

        if (isset($_POST['buttonKillSession'])) {
            session_unset();
            session_destroy();

            echo 'You have been logged out';
        }

        ?>

        <?php

        // search function
        // search box and button
        // list all category as dropdown
        // search display

        // load genre
        // make search query
        // $getGenreSql = 'SELECT DISTINCT genre FROM tb_movie';

        if (isset($_POST['buttonSearch'])) {
        }

        ?>

        <form method="post">
            <input type="text" name="searchName" placeholder="Search here...">
            <input type="submit" name="button" value="Search" />

        </form>

        <?php

        echo '<br>';

        if (isset($_POST['button'])) {
            $searchName = $_POST['searchName'];

            // possible problem with search query

            // $getMovieSql = 'SELECT * FROM tb_movie WHERE movieName LIKE "%$searchName%"';
            $getMovieSql = "SELECT * FROM tb_movie WHERE movieName LIKE '%$searchName%'";
            // use Conn to read data
            $res = Conn($getMovieSql) or exit(mysqli_error($conn));

            if (mysqli_num_rows($res) < 1) {
                echo 'no movies avalible';
            } else {
                while ($row = mysqli_fetch_array($res)) {
                    $movieId = $row['movieID'];
                    $movieName = stripslashes($row['movieName']);
                    $movieDesc = $row['description'];
                    $movieGenre = stripslashes($row['genre']);
                    $movieYear = stripslashes($row['year']);
                    $movieRun = $row['runtime'];
                    $meanRating = $row['meanRating'];
                    $nRatings = $row['numberOfRatings'];
                    $movieCover = $row['cover'];

                    // echo "<li>$movieName</li>";

                    echo "<li><a href=\"movie.php?movieId=$movieId&movieName=$movieName&movieDesc=$movieDesc&movieGenre=$movieGenre&movieYear=$movieYear&movieRun=$movieRun&meanRating=$meanRating&nRatings=$nRatings&movieCover=$movieCover\">$movieName ($movieYear)</a></li>";
                }
            }
        }
        ?>








        <?php
        // display movie catalog with 5 random movies
        $randomSectionWelcomeText = "<h4>I'm feeling lucky</h4>";

        echo $randomSectionWelcomeText;
        // Make the sql query
        $getMovieSql = 'SELECT * FROM tb_movie ORDER BY rand() LIMIT 5';
        // use Conn to read data
        $res = Conn($getMovieSql) or exit(mysqli_error($conn));

        if (mysqli_num_rows($res) < 1) {
            echo 'no movies avalible';
        } else {
            while ($row = mysqli_fetch_array($res)) {
                $movieId = $row['movieID'];
                $movieName = stripslashes($row['movieName']);
                $movieDesc = $row['description'];
                $movieGenre = stripslashes($row['genre']);
                $movieYear = stripslashes($row['year']);
                $movieRun = $row['runtime'];
                $meanRating = $row['meanRating'];
                $nRatings = $row['numberOfRatings'];
                $movieCover = $row['cover'];

                // echo "<li>$movieName</li>";

                echo "<li><a href=\"movie.php?movieId=$movieId&movieName=$movieName&movieDesc=$movieDesc&movieGenre=$movieGenre&movieYear=$movieYear&movieRun=$movieRun&meanRating=$meanRating&nRatings=$nRatings&movieCover=$movieCover\">$movieName ($movieYear)</a></li>";
            }
        }

        ?>

    </div>

</body>

</html>