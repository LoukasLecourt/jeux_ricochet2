class Hud {
  // Atributs
  int seconde, minute, nb_coup;

  // Constructeur
  Hud () {
    this.seconde = 0;
    this.minute = 0;
    this.nb_coup = 0;
  }

  Hud (int sec, int min, int nb) {
    this.seconde = sec;
    this.minute = min;
    this.nb_coup = nb;
  }

  // Méthodes
  void setCoup(int nb) {
    nb_coup = nb;
  }

  int getCoup() {
    return nb_coup;
  }

  void setSec(int sec) {
    seconde = sec;
  }

  void setMin(int min) {
    minute = min;
  }

  void dessiner_hud(String perso) {

    PImage hud;
    hud = loadImage("ricochet-robots-hud.png");
    image(hud, 1000, 400, 400, 800);

    // Titre
    textFont(police);
    fill(255);
    textSize(32);
    text("Jeux ricochet", 953, 54);
    fill(255, 127, 0);
    textSize(32);
    text("Jeux ricochet", 954, 55);

    // Chrono et nombre de coups
    fill(127);
    textSize(25);
    text("TEMPS", 830, 110);
    text(":", 890, 110);
    text("NOMBRE DE COUPS:", 830, 150);
    text("Min,", 935, 110);
    text("Sec", 1000, 110);

    fill(255, 127, 0);
    textSize(27);
    text(minute, 910, 110);
    text(seconde, 975, 110);
    text(nb_coup, 1000, 150);

    // Personnage selectionnée
    fill(127);
    textSize(25);
    text("PERSONNAGE SÉLECTIONNÉ:", 830, 215);
    rect(1053, 180, 62, 62);
    String id = "ricochet-robots-" + perso + ".jpg";
    PImage persoSelectionne;
    persoSelectionne = loadImage(id);
    image(persoSelectionne, 1085, 212, 55, 55);

    // Messages explication du jeux
    textSize(20);
    fill(220);
    text("Cliques sur le personnage pour en prendre le contrôle.", 842, 280);
    text("Le but de ce jeu est de mener un personnage sur", 856, 300);
    text("l'objectif présent au centre du plateau.", 890, 320);
  }
}
