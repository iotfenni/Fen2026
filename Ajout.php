<?php
// 1. Connexion à la base de données
$host = "localhost";
$user = "root";
$password = "";
$dbname = "bds"; // Remplacez par le nom de votre base

$conn = mysqli_connect($host, $user, $password, $dbname);

// Vérification de la connexion
if (!$conn) {
    die("Échec de la connexion : " . mysqli_connect_error());
}

// 2. Récupération des données du formulaire
$id = $_POST['idUtil'];
$nom = $_POST['nom'];

// 3. Préparation et exécution de la requête d'insertion
$sql = "INSERT INTO Utilisateur (idUtil, nomPrenom) VALUES ('$id', '$nom')";

if (mysqli_query($conn, $sql)) {
    // Message de succès
    echo "Utilisateur ajouté avec succès";
} else {
    // Message d'erreur
    echo "Erreur d’insertion des données";
}

// 4. Fermeture de la connexion
mysqli_close($conn);
?>
