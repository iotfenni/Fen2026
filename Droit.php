<?php
$conn = mysqli_connect("localhost", "root", "", "bds");

$idUtil = $_POST['idUtil'];
$idDoc = $_POST['idDoc'];
$ecr = isset($_POST['ecr']) ? 'O' : 'N';
$lec = isset($_POST['lec']) ? 'O' : 'N';
$imp = isset($_POST['imp']) ? 'O' : 'N';

// 1. Vérifier si l'utilisateur existe
$resUser = mysqli_query($conn, "SELECT * FROM Utilisateur WHERE idUtil = '$idUtil'");

if (mysqli_num_rows($resUser) == 0) {
    echo "Erreur : Utilisateur inexistant";
} else {
    // 2. Vérifier si des droits existent déjà pour ce couple Utilisateur/Document
    $resDroit = mysqli_query($conn, "SELECT * FROM Droit WHERE idUtil = '$idUtil' AND idDoc = '$idDoc'");

    if (mysqli_num_rows($resDroit) > 0) {
        // Mise à jour
        $sqlUpd = "UPDATE Droit SET ecriture='$ecr', lecture='$lec', impression='$imp' 
                   WHERE idUtil='$idUtil' AND idDoc='$idDoc'";
        if (mysqli_query($conn, $sqlUpd)) {
            echo "Mise à jour des droits d'accès réussie";
        }
    } else {
        // Insertion
        $sqlIns = "INSERT INTO Droit VALUES ('$idDoc', '$idUtil', '$ecr', '$lec', '$imp')";
        if (mysqli_query($conn, $sqlIns)) {
            echo "Insertion des droits d'accès réussie";
        }
    }
}

mysqli_close($conn);
?>
