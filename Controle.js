// --- Fonctions pour utilisateur.html ---

function verif1() {
    // Récupération des valeurs des champs
    let id = document.getElementById("idUtil").value;
    let nom = document.getElementById("nom").value;

    // Vérification que les champs ne sont pas vides
    if (id === "" || nom === "") {
        alert("Veuillez remplir tous les champs (Identifiant et Nom).");
        return false;
    }
    
    // Optionnel : Vérifier que l'identifiant fait exactement 4 caractères
    if (id.length !== 4) {
        alert("L'identifiant doit comporter exactement 4 caractères.");
        return false;
    }

    return true; 
}

// --- Fonctions pour droit.html ---

function verif2() {
    // 1. Vérification de la sélection du document
    let doc = document.getElementsByName("idDoc")[0].value;
    if (doc === "") {
        alert("Veuillez sélectionner un document.");
        return false;
    }

    // 2. Vérification qu'au moins une case est cochée
    let ecr = document.getElementsByName("ecr")[0].checked;
    let lec = document.getElementsByName("lec")[0].checked;
    let imp = document.getElementsByName("imp")[0].checked;

    if (!ecr && !lec && !imp) {
        alert("Veuillez accorder au moins un droit d'accès.");
        return false;
    }

    return true;
}

function choix1() {
    // Si Ecriture est cochée -> cocher Lecture automatiquement
    if (document.getElementsByName("ecr")[0].checked) {
        document.getElementsByName("lec")[0].checked = true;
    }
}

function choix2() {
    // Si Lecture est décochée -> décocher Ecriture et Impression (cohérence)
    if (!document.getElementsByName("lec")[0].checked) {
        document.getElementsByName("ecr")[0].checked = false;
        document.getElementsByName("imp")[0].checked = false;
    }
}

function choix3() {
    // Si Impression est cochée -> cocher Lecture automatiquement
    if (document.getElementsByName("imp")[0].checked) {
        document.getElementsByName("lec")[0].checked = true;
    }
}
