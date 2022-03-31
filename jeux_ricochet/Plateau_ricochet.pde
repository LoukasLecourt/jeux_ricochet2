class Plateau {
  // Atributs
  int tPlateau, nbCases, objectif;

  // Constructeurs
  Plateau() {
    this.tPlateau = 800 ;
    this.nbCases = 16;
  }
  Plateau(int tP, int nbC) {
    this.tPlateau = tP;
    this.nbCases = nbC;
  }

  // Methodes
  void dessiner_bordure() {
    // Charge les images
    PImage bordureH, bordureB, bordureG, bordureD;
    bordureH = loadImage("ricochet-robots-bordure-haut.jpg");
    bordureB = loadImage("ricochet-robots-bordure-bas.jpg");
    bordureG = loadImage("ricochet-robots-bordure-gauche.jpg");
    bordureD = loadImage("ricochet-robots-bordure-droit.jpg");
    // Affiche les images
    image(bordureH, 400, 0, 800, 15);
    image(bordureB, 400, height, 800, 15);
    image(bordureG, 0, 400, 15, 800);
    image(bordureD, 800, 400, 10, 800);
  }

  // Dessine le centre avec un objectif aléatoire
  void dessiner_centre(String objectif) {
    String id = "ricochet-robots-objectif" + objectif + ".jpg";
    PImage centre, centreObjectif;
    centre = loadImage("ricochet-robots-centrePlateau.jpg");
    centreObjectif = loadImage(id);
    image(centre, 400, 400, 100, 100);
    image(centreObjectif, 398, 398, 62, 62);
  }

  // Prend une image et creer un plateau grace à elle
  void dessiner_fond() {
    imageMode(CENTER);
    PImage casePlateau;
    casePlateau = loadImage("ricochet-robots-case.png");
    for (int i=25; i <tPlateau; i+=50) {
      for (int j=25; j<tPlateau; j+=50) {
        image(casePlateau, i, j, 50, 50);
      }
    }
  }
}
