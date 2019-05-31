<!DOCTYPE html>
<html>
    <title>Rutele trenurilor</title>

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
                    /*background-color: #f2f2f2; */
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
                }

                input[type=submit] {
                    width: 35%;
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

                * { box-sizing: border-box; }

body {
  font: 16px Arial; 
}

.autocomplete {
  /*the container must be positioned relative:*/
  position: relative;
  display: inline-block;
}

.autocomplete2 {
  /*the container must be positioned relative:*/
  position: relative;
  display: inline-block;
}

input {
  border: 1px solid transparent;
  background-color: #f1f1f1;
  padding: 10px;
  font-size: 16px;
}

input[type=text] {
  background-color: #f1f1f1;
  width: 100%;
}

input[type=submit] {
  background-color: DodgerBlue;
  color: #fff;
}
.autocomplete-items {
  position: absolute;
  border: 1px solid #d4d4d4;
  border-bottom: none;
  border-top: none;
  z-index: 99;
  /*position the autocomplete items to be the same width as the container:*/
  top: 100%;
  left: 0;
  right: 0;
  margin-top: -25px;
}
.autocomplete-items div {
  padding: 10px;
  cursor: pointer;
  background-color: #f1f1f1; 
  border-bottom: 1px solid #d4d4d4; 
  color: black;
}
.autocomplete-items div:hover {
  /*when hovering an item:*/
  background-color: #e9e9e9; 
}
.autocomplete-active {
  /*when navigating through the items using the arrow keys:*/
  background-color: DodgerBlue !important; 
  color: #ffffff; 
}

            </style>
    </head>

    <body bgcolor="#000000">

        <div class="trains-image">
            <ul>
            <li><a href="index.php">Rute trenuri</a></li>
            <li><a href="tren.php">Caută după tren</a></li> 
            <li><a href="statie.php">Caută după stație</a></li>
            <li><a href="mentenanta_statie.php">Caută mentenanță după stație</a></li>
            <li><a href="mentenanta_tren.php">Caută mentenanță după tren</a></li> 
            <li><a class="active" href="intarzieri.php">Întârzieri</a></li>
            <li><a href="rebalansare.php">Rebalansare</a></li>
        </ul>

            <div class="hero-text">
                <h1 style="font-size:50px">Rutele trenurilor</h1>

<div class="routes-panel">
            
                <!--
                <h1 style="font-size:30px">Rute de călătorie</h1>
                -->
            
        

    <form autocomplete="off" action="/Interface/intarzieri.php" method="get">
            <br><br><b><font size="+2">Numele stațiilor:</font></b><br><br><br>

            <div class="autocomplete" style="width:300px;">
                <input id="myInput" type="text" name="statiePlecare" placeholder="Id tren" required><br><br>
            </div>

            <div class="autocomplete2" style="width:300px;">
                <input id="myInput2"  type="number" name="statieSosire" placeholder="Intârziere" required><br><br>
            </div>
            

            <!--
                <label>Stație de plecare:</label>
                <select name="statie1" required>
                    <option value="arad">Arad</option>
                    <option value="iasi">Iasi</option>
                </select>

                <label>Stație de sosire:</label>
                <select name="statie2" class="select" required>
                </select>
            -->
            <div></div>
            <input type="submit" value="Elimină întârziere" name="El"><br><br>
                <input type="submit" value="Adaugă întârziere" name="Ad"><br><br>

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
                <form method="get" action="#bottom">
                    <button>Vezi rute</button>
                </form>
                -->

<!--
                <button class="button display-left" onclick="plusDivs(-1)">&#10094;</button>
                <button class="button display-right" onclick="plusDivs(1)">&#10095;</button>
-->
            </div>
        </div>

        <script>

            function autocomplete ( inp, arr ) {
                var currentFocus;

                inp.addEventListener ( "input", function ( e ) {
                    var a, b, i, val = this.value;

                    /* close any already open lists of autocompleted values */
                    closeAllLists();

                    if ( !val ) { return false; }

                    currentFocus = -1;

                    /* create a DIV element that will contain the items ( values ): */
                        a = document.createElement ( "DIV" );
                        a.setAttribute ( "id", this.id + "autocomplete-list" );
                        a.setAttribute ( "class", "autocomplete-items" );

                    /* append the DIV element as a child of the autocomplete container: */
                    this.parentNode.appendChild ( a );

                    /* for each item in the array...*/
                    for ( i = 0; i < arr.length; i++ ) {
                        /* check if the item starts with the same letters as the text field value: */
                        if ( arr[i].substr ( 0, val.length ).toUpperCase() == val.toUpperCase() ) {
                            /* create a DIV element for each matching element: */
                            b = document.createElement ( "DIV" );

                            /* make the matching letters bold: */
                            b.innerHTML = "<strong>" + arr[i].substr ( 0, val.length ) + "</strong>";
                            b.innerHTML += arr[i].substr ( val.length );

                            /* insert an input field that will hold the current array item's value: */
                            b.innerHTML += "<input type='hidden' value='" + arr[i] + "'>";

                            /* execute a function when someone clicks on the item value (DIV element): */
                            b.addEventListener ( "click", function ( e ) {

                                /* insert the value for the autocomplete text field: */
                                inp.value = this.getElementsByTagName ( "input" )[0].value;

                                /* close the list of autocompleted values (or any other open lists of autocompleted values) */
                                closeAllLists();
                            } );

                            a.appendChild ( b );
                        }
                    }
                } );

                /* execute a function when a key on the keyboard is pressed */
                inp.addEventListener ( "keydown", function ( e ) {
                    var x = document.getElementById ( this.id + "autocomplete-list" );
                    if ( x ) x = x.getElementsByTagName ( "div" );
                    if ( e.keyCode == 40 ) {
                        /* If the arrow DOWN key is pressed, increase the currentFocus variable: */
                    currentFocus++;
                    /* and make the current item more visible */
                    addActive ( x );
                    } else if ( e.keyCode == 38 ) {
                        /* If the arrow UP key is pressed, decrease the currentFocus variable: */
                        currentFocus--;
                        /* and make the current item more visible */
                        addActive ( x );
                    } else if ( e.keyCode == 13 ) {
                        /* If the ENTER key is pressed, prevent the from from being submitted */
                        e.preventDefault();
                        if ( currentFocus > -1 ) {
                            /* and simulate a click on the "active" item */
                            if ( x ) x[currentFocus].click();
                        }
                    }
                } );

                function addActive ( x ) {
                    /* a function to classify an item as "active" */
                    if ( !x ) return false;

                    /* start by removing the "active" class on all items */
                    removeActive ( x );

                    if ( currentFocus >= x.length ) currentFocus = 0;
                    if ( currentFocus < 0 ) currentFocus = ( x.length - 1 );

                    /* add class "autocomplete-active" */
                    x[currentFocus].classList.add ( "autocomplete-active" );
                }

                function removeActive ( x ) {
                    /* a function to remove the "active" class from all autocomplete items: */
                    for ( var i = 0; i < x.length; i++ ) {
                        x[i].classList.remove ( "autocomplete-active" );
                    }
                }

                function closeAllLists ( elmnt ) {
                    /* close all autocomplete lists in the document, except the one passed as an argument: */
                    var x = document.getElementsByClassName ( "autocomplete-items" );

                    for ( var i = 0; i < x.length; i++ ) {
                        if ( elmnt != x[i] && elmnt != inp ) {
                            x[i].parentNode.removeChild ( x[i] );
                        }
                    }
                }

                /* execute a function when someone clicks in the document */
                document.addEventListener ( "click", function ( e ) {
                    closeAllLists ( e.target );
                } );
            }

var countries = ["Abrud","Adjud","Agnita","Aiud","Alba Iulia","Alesd","Alexandria","Amara","Anina","Aninoasa","Arad","Ardud","Avrig","Azuga","Babadag","Babeni","Bacau","Baia de Arama","Baia de Aries","Baia Mare","Baia Sprie","Baicoi","Baile Govora","Baile Herculane","Baile Olanesti","Baile Tusnad","Bailesti","Balan","Balcesti","Bals","Baraolt","Barlad","Bechet","Beclean","Beius","Berbesti","Beresti","Bicaz","Bistrita","Blaj","Bocsa","Boldesti-Scaeni","Bolintin-Vale","Borsa","Borsec","Botosani","Brad","Bragadiru","Braila","Brasov","Breaza","Brezoi","Brosteni","Bucecea","Bucuresti","Budesti","Buftea","Buhusi","Bumbesti-Jiu","Busteni","Buzau","Buzias","Cajvana","Calafat","Calan","Calarasi","Calimanesti","Campeni","Campia Turzii","Campina","Campulung Moldovenesc","Campulung","Caracal","Caransebes","Carei","Cavnic","Cazanesti","Cehu Silvaniei","Cernavoda","Chisineu-Cris","Chitila","Ciacova","Cisnadie","Cluj-Napoca","Codlea","Comanesti","Comarnic","Constanta","Copsa Mica","Corabia","Costesti","Covasna","Craiova","Cristuru Secuiesc","Cugir","Curtea de Arges","Curtici","Dabuleni","Darabani","Darmanesti","Dej","Deta","Deva","Dolhasca","Dorohoi","Draganesti-Olt","Dragasani","Dragomiresti","Drobeta-Turnu Severin","Dumbraveni","Eforie","Fagaras","Faget","Falticeni","Faurei","Fetesti","Fieni","Fierbinti-Targ","Filiasi","Flamanzi","Focsani","Frasin","Fundulea","Gaesti","Galati","Gataia","Geoagiu","Gheorgheni","Gherla","Ghimbav","Giurgiu","Gura Humorului","Harlau","Harsova","Hateg","Horezu","Huedin","Hunedoara","Husi","Ianca","Iasi","Iernut","Ineu","Insuratei","Intorsura Buzaului","Isaccea","Jibou","Jimbolia","Lehliu Gara","Lipova","Liteni","Livada","Ludus","Lugoj","Lupeni","Macin","Magurele","Mangalia","Marasesti","Marghita","Medgidia","Medias","Miercurea Ciuc","Miercurea Nirajului","Miercurea Sibiului","Mihailesti","Milisauti","Mioveni","Mizil","Moinesti","Moldova Noua","Moreni","Motru","Murfatlar","Murgeni","Nadlac","Nasaud","Navodari","Negresti","Negresti-Oas","Negru Voda","Nehoiu","Novaci","Nucet","Ocna Mures","Ocna Sibiului","Ocnele Mari","Odobesti","Odorheiu Secuiesc","Oltenita","Onesti","Oradea","Orastie","Oravita","Orsova","Otelu Rosu","Otopeni","Ovidiu","Panciu","Pancota","Pantelimon","Pascani","Patarlagele","Pecica","Petrila","Petrosani","Piatra Neamt","Piatra-Olt","Pitesti","Ploiesti","Plopeni","Podu Iloaiei","Pogoanele","Popesti-Leordeni","Potcoava","Predeal","Pucioasa","Racari","Radauti","Ramnicu Sarat","Ramnicu Valcea","Rasnov","Recas","Reghin","Resita","Roman","Rosiorii de Vede","Rovinari","Roznov","Rupea","Sacele","Sacueni","Salcea","Saliste","Salistea de Sus","Salonta","Sangeorgiu de Padure","Sangeorz-Bai","Sannicolau Mare","Santana","Sarmasu","Satu Mare","Saveni","Scornicesti","Sebes","Sebis","Segarcea","Seini","Sfantu Gheorghe","Sibiu","Sighetu Marmatiei","Sighisoara","Simeria","Simleu Silvaniei","Sinaia","Siret","Slanic","Slanic-Moldova","Slatina","Slobozia","Solca","Somcuta Mare","Sovata","Stefanesti, Arges","Stefanesti, Botosani","Stei","Strehaia","Suceava","Sulina","Talmaciu","Tandarei","Targoviste","Targu Bujor","Targu Carbunesti","Targu Frumos","Targu Jiu","Targu Lapus","Targu Mures","Targu Neamt","Targu Ocna","Targu Secuiesc","Tarnaveni","Tasnad","Tautii-Magheraus","Techirghiol","Tecuci","Teius","Ticleni","Timisoara","Tismana","Titu","Toplita","Topoloveni","Tulcea","Turceni","Turda","Turnu Magurele","Ulmeni","Ungheni","Uricani","Urlati","Urziceni","Valea lui Mihai","Valenii de Munte","Vanju Mare","Vascau","Vaslui","Vatra Dornei","Vicovu de Sus","Victoria","Videle","Viseu de Sus","Vlahita","Voluntari","Vulcan","Zalau","Zarnesti","Zimnicea","Zlatna"];

autocomplete(document.getElementById("myInput"), countries);
autocomplete(document.getElementById("myInput2"), countries);

</script>

<?php

    $conn = oci_connect('proiect', 'proiect', 'localhost/XE');
    if (!$conn) {
    $e = oci_error();
    trigger_error(htmlentities($e['message'], ENT_QUOTES), E_USER_ERROR);
}

    if(isset($_GET['Ad'])){
    $statie1=$_GET['statiePlecare'];
    $statie2=$_GET['statieSosire'];
    $stid = oci_parse($conn, " BEGIN
    update TRASEU set INTARZIERE=".$statie2." where ID_TRASEU='".$statie1."'; end;");
    oci_execute($stid);
    echo "<p class ='white-table'>Au fost adaugate $statie2 minute întârziere traseului cu id-ul $statie1</p>";
    }
    else if(isset($_GET['El']))
    {
    $statie1=$_GET['statiePlecare'];
    $statie2=$_GET['statieSosire'];
    $stid = oci_parse($conn, " BEGIN
    update TRASEU set INTARZIERE=0 where ID_TRASEU='".$statie1."'; end;");
    oci_execute($stid);
    echo "<p class ='white-table'>Au fost eliminate minute de întârziere ale traseului cu id-ul $statie1</p>";
    }
    
   

?>

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

        
<br><br>
        <div id="bottom" class="routes-panel">
            
                <!--
                <h1 style="font-size:30px">Rute de călătorie</h1>
                -->
            
        <!--

    <form action="/action_page.php">
            <br><br><b>Numele stațiilor:</b><br><br><br>

                <input type="text" name="station1" placeholder="Stație de plecare.." required><br><br>
                <input type="text" name="station2" placeholder="Stație de sosire.." required><br><br>

            <!--
                <label>Stație de plecare:</label>
                <select name="statie1" required>
                    <option value="arad">Arad</option>
                    <option value="iasi">Iasi</option>
                </select>

                <label>Stație de sosire:</label>
                <select name="statie2" class="select" required>
                </select>
            -->

<!--
                <br><p><b class="date">Data plecării:</b></p><br>
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
    </body>
</html>
