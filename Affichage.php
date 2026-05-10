<?php
$conn = mysqli_connect("localhost", "root", "", "bds");

$idDoc = $_POST['idDoc'];

// 1. Récupérer le nom du document sélectionné
$resDoc = mysqli_query($conn, "SELECT nomDoc FROM Document WHERE idDoc = '$idDoc'");
$donneeDoc = mysqli_fetch_array($resDoc);
$nomDoc = $donneeDoc['nomDoc'];

echo "<h3>Les droits d'accès relatifs au document : $nomDoc</h3>";

// 2. Récupérer les droits et les noms des utilisateurs (Jointure)
$sql = "SELECT U.nomPrenom, D.ecriture, D.lecture, D.impression 
        FROM Utilisateur U, Droit D 
        WHERE U.idUtil = D.idUtil AND D.idDoc = '$idDoc'";

$resDroits = mysqli_query($conn, $sql);

// 3. Affichage des résultats
if (mysqli_num_rows($resDroits) > 0) {
    while ($ligne = mysqli_fetch_array($resDroits)) {
        echo "<p>";
        echo $ligne['nomPrenom'] . " &nbsp;&nbsp; ";
        echo $ligne['ecriture'] . " &nbsp;&nbsp; ";
        echo $ligne['lecture'] . " &nbsp;&nbsp; ";
        echo $ligne['impression'];
        echo "</p>";
    }
} else {
    echo "Aucun droit attribué pour ce document.";
}

mysqli_close($conn);
?>
