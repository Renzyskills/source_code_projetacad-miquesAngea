const header = document.querySelector("header");

window.addEventListener("scroll", function() {
    header.classList.toggle("sticky", window.scrollY > 150);
});


// Sélection des éléments des barres de compétences
const skillBars = document.querySelectorAll(".Services .progress-bar");

// Parcours de chaque barre de compétences
skillBars.forEach(skillBar => {
    // Récupération de la valeur du pourcentage depuis l'attribut "aria-valuenow"
    const percentage = parseInt(skillBar.getAttribute("aria-valuenow"));

    // Animation progressive de la largeur de la barre de compétences
    skillBar.style.width = "0"; // Commence avec une largeur de 0
    setTimeout(() => {
        skillBar.style.width = percentage + "%"; // Augmente progressivement la largeur jusqu'au pourcentage indiqué
    }, 100);

    // Changement de couleur de fond au survol
    skillBar.addEventListener("mouseenter", () => {
        skillBar.style.backgroundColor = "#1ABC9C"; // Nouvelle couleur de fond au survol
    });

    // Retour à la couleur d'origine lorsque la souris quitte la barre de compétences
    skillBar.addEventListener("mouseleave", () => {
        skillBar.style.backgroundColor = "#3498DB"; // Couleur de fond par défaut
    });
});

