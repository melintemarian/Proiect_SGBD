<!DOCTYPE html>
<html>
    <title>Caută după tren</title>

    <head>
        <link rel="stylesheet" type="text/css" href="table.css">
        <meta name="viewport" content="width=device-width, initial-scale=1">
            <style>
                body, html {
                    height: 100%;
                    margin: 0;
                    font-family: Arial, Helvetica, sans-serif;
                }

                label {
                    width: 40%;
                    float: left;
                    padding-top: 20px;
                }

                ul {
                    list-style-type: none;
                    margin: 0;
                    padding: 0;
                    overflow: hidden;
                    border: 0px solid #e7e7e7;
                    background-color: #f3f3f3;
                    position: fixed;
                    width: 100%;
                    z-index: 1;
                }

                li {
                    float: left;
                }

                li a {
                    display: block;
                    color: #666;
                    text-align: center;
                    padding: 14px 16px;
                    text-decoration: none;
                }

                li a:hover:not(.active) {
                    background-color: #ddd;
                }

                li a.active {
                    color: white;
                    background-color: #04c6ed;
                }

                .header {
                    padding: 1px;
                    background: white;
                    color: white;
                    font-size: 15px;
                }

                .mySlides { display: none; }

                .display-container { position: relative; }

                .trains-image {
                    background-image: linear-gradient( rgba(0, 0, 0, 0.6), rgba(0, 0, 0, 0.6), rgba(0, 0, 0, 0.6), rgba(0, 0, 0, 0.6), rgba(0, 0, 0, 0.6), rgba(0, 0, 0, 0.6), rgba(0, 0, 0, 0.6), rgba(0, 0, 0, 0.6), #000000),  url("trains.jpg");
                    height: 100%;
                    background-position: center;
                    background-repeat: no-repeat;
                    background-size: cover;
                    position: relative;
                    display: block;
                }

                .my-train-image {
                    display: none;
                    background-image: linear-gradient(rgba(0, 0, 0, 0.5), rgba(0, 0, 0, 0.5)), url("my-train.jpg");
                    height: 50%;
                    background-position: center;
                    background-repeat: no-repeat;
                    background-size: cover;
                    position: relative;
                }

                .routes-panel {
                    text-align: center;
                    color: white;
                    border-radius: 25px;
                    border-color: #000000;
                    padding: 0px;
                    width: 450px;
                    margin-left: auto;
                    margin-right: auto;
                }

                .hero-text {
                    text-align: center;
                    position: absolute;
                    top: 50%;
                    left: 50%;
                    transform: translate(-50%, -50%);
                    color: white;
                }

                .hero-text button {
                    border: none;
                    outline: 0;
                    display: inline-block;
                    padding: 10px 25px;
                    color: black;
                    background-color: #ddd;
                    text-align: center;
                    cursor: pointer;
                }

                .hero-text button:hover {
                    background-color: #555;
                    color: white;
                }

                .content { max-width: 1920px;
                           height: 100%;
                           background-position: center;
                           background-size: cover;
                           position: relative;
                           background-repeat: no-repeat;
                           position: relative;  }

                .display-left {
                    position: absolute;
                    top: 50%;
                    left: -20%;
                    transform: translate ( 0%, -50% );
                }

                .display-right {
                    position: absolute;
                    top: 50%;
                    right: -20%;
                    transform: translate ( 0%, -50% );
                }

                input[type=text], select {
                    width: 55%;
                    float: center;
                    padding: 12px 20px;
                    margin: 8px 0;
                    margin-right: 5%;
                  /*  display: inline-block; */
                    border: 1px solid #ccc;
                    border-radius: 4px;
                    box-sizing: border-box;
                    margin-top: 50px;
                }

                input[type=submit] {
                    width: 30%;
                    background-color: #04c6ed;
                    color: white;
                    padding: 14px 20px;
                    margin: 8px 0;
                    border: none;
                    border-radius: 4px;
                    cursor: pointer;
                }

                input[type=submit]:hover {
                    background-color: #04acce;
                }

                input[type=date] {
                    width: 90%;
                    padding: 12px 20px;
                    margin: 8px 0;
                    display: inline-block;
                    border: 1px solid #ccc;
                    border-radius: 4px;
                    box-sizing: border-box;
                }

                bgcolor {
                    background-image: linear-gradient(#04c6ed, #000000);
                }

                .date {
                    margin-bottom: 10px;
                }

                .select {
                    margin-bottom: 50px;
                }

            </style>
    </head>

    <body bgcolor="#000000">

        <div class="trains-image">
            <ul>
            <li><a href="index.php">Rute trenuri</a></li>
            <li><a class="active" href="tren.php">Caută după tren</a></li>
            <li><a href="statie.php">Caută după stație</a></li>
            <li><a href="mentenanta_statie.php">Caută mentenanță după stație</a></li>
            <li><a href="mentenanta_tren.php">Caută mentenanță după tren</a></li>
            <li><a  href="intarzieri.php">Întârzieri</a></li>
            <li><a href="rebalansare.php">Rebalansare</a></li>
        </ul>

            <div class="hero-text">
                <h1 style="font-size:50px">Caută după tren</h1>

            <div id="bottom" class="routes-panel">
            
                <!--
                <h1 style="font-size:30px">Rute de călătorie</h1>
                -->
            
        

    <form action="/Interface/tren.php">

            <!--
            <br><br><b>Număr tren:</b><br><br><br>
            -->

                <input type="text" name="train" placeholder="Număr tren.." required><br><br>


                <br><p><b class="date"><font size="+2">Data:</font></b></p><br>
                <input type="date" name="date" value="2019-05-30" min="2019-05-30" max="2019-06-30"><br><br>
                <input type="submit" value="Caută"><br><br>

    </form>

        <!--
        <form>
            <br><br>Data plecării:<br><br>
                <input type="date" name="date">
        </form>

        <br><br>
        <input type="submit" value="Caută">
        -->
        
    </div>

<!--
                <button class="button display-left" onclick="plusDivs(-1)">&#10094;</button>
                <button class="button display-right" onclick="plusDivs(1)">&#10095;</button>
-->
            </div>
        </div>

        <!--
        <div class="content">

            <img class="mySlides" src="trains.jpg" style="width:100%">
            <img class="mySlides" src="my-train.jpg" style="width:100%">

            <button class="button display-left" onclick="plusDivs(-1)">&#10094;</button>
            <button class="button display-right" onclick="plusDivs(1)">&#10095;</button>
        </div>
        -->

<!--
        <script>
            var slideIndex = 1;
            showDivs(slideIndex);

            function plusDivs(n) {
                showDivs(slideIndex += n);
            }

            function showDivs(n) {
                var i;
                var x = document.getElementsByClassName("trains-image");

                if ( n > x.length ) { slideIndex = 1 }
                if ( n < 1 ) { slideIndex = x.length }

                for ( i = 0; i < x.length; i++ ) { x[i].style.background-image = "linear-gradient(rgba(0, 0, 0, 0.5), rgba(0, 0, 0, 0.5)), url(\"trains.jpg\")" }

                x[slideIndex - 1].style.display = "block";
            }
        </script>

        <!--
<br><br>
        <div id="bottom" class="routes-panel">
            
                <!--
                <h1 style="font-size:30px">Rute de călătorie</h1>
                -->
            
        
<!--
    <form action="/action_page.php">

            <!--
            <br><br><b>Număr tren:</b><br><br><br>
            -->
<!--
                <input type="text" name="train" placeholder="Număr tren.." required><br><br>


                <br><p><b class="date">Data:</b></p><br>
                <input type="date" name="date"><br><br>
                <input type="submit" value="Caută"><br><br>

    </form>

        <!--
        <form>
            <br><br>Data plecării:<br><br>
                <input type="date" name="date">
        </form>

        <br><br>
        <input type="submit" value="Caută">
        -->
        <!--
    </div>

<br><br>
-->

<?php
    $tren=$_GET['train'];

    $conn = oci_connect('proiect', 'proiect', 'localhost/XE');
    if (!$conn) {
        $e = oci_error();
        trigger_error(htmlentities($e['message'], ENT_QUOTES), E_USER_ERROR);
    }
    
    $curs = oci_new_cursor($conn);
    
    $stid = oci_parse($conn, " SELECT ID_TRASEU,st1.NUME_STATIE,st2.NUME_STATIE,STARE_TREN,INTARZIERE from TRASEU tr
    join statii st1 on st1.ID_STATIE=tr.ID_STATIE_PLECARE
    join statii st2 on st2.ID_STATIE=tr.ID_STATIE_SOSIRE
    where ID_TRASEU='".$tren."'");
    //oci_bind_by_name($stid, ':var1', $statie1);
    //oci_bind_by_name($stid, ':var2', $statie2);
    oci_execute($stid);
    echo "<table class ='white-table' border='1'>\n";
        while (($row = oci_fetch_array($stid))) {
        echo "<tr>\n";
        foreach ($row as $item) {
        echo "    <td>" . ($item !== null ? htmlentities($item, ENT_QUOTES) : "Nimic") . "</td>\n";
        }
        echo "</tr>\n";
        }
        echo "</table>\n";

?>
    </body>
</html>

