class Personnage {
  // Atribut
  float poseX, poseY;
  int posAleatoire, compteur;
  String perso;

  // Constructeurs
  Personnage(String p) {
    this.posAleatoire = int(random(0, 255));
    this.compteur = 0;
    this.perso = p;
    for (int positionX=25; positionX <800; positionX+=50) {
      for (int positionY=25; positionY < 800; positionY+=50) {
        if (compteur == posAleatoire) {
          poseY = float(positionY);
          poseX = float(positionX);
        }
        compteur+=1;
      }
    }
  }

  Personnage(int pX, int pY, String p) {
    this.poseX = pX;
    this.poseY = pY;
    this.posAleatoire = int(random(0, 255));
    this.compteur = 0;
    this.perso = p;
  }

  // Methode
  void dessinerPerso() {
    String id = "ricochet-robots-" + perso + ".jpg";
    PImage persoSelectionne;
    persoSelectionne = loadImage(id);
    image(persoSelectionne, poseX, poseY, 35, 35);
  }


  float getX() {
    return poseX;
  }

  float getY() {
    return poseY;
  }

  boolean contact(int pX, int pY) {
    boolean stop = false;
    for (int i =0; i<mur.length; i++) {
      stop = dist(poseX, poseY, pX, pY) < 15;
    }
    if (stop) {
      return false;
    } else {
      return true;
    }
  }

  void mouv(String persoSelectionne, boolean contact) {
    if (persoSelectionne == perso) {
      if ( keyCode == LEFT) {
        if (contact && poseX>25) {
          poseX -=0.5;
        } else {
          keyCode = 0;
        }
      }
      if ( keyCode == RIGHT) {
        if (contact && (((poseX<330 && poseX>25) || (poseX<775 && poseX>450)) && ((poseY>25 && poseY<330) || (poseY<775 && poseY>450)))) {
          poseX +=0.5;
        } else {
          keyCode = 0;
        }
      }
      if ( keyCode == UP) {
        if (contact && poseY>25 ) {
          poseY -=0.5;
        } else {
          keyCode = 0;
        }
      }
      if ( keyCode == DOWN ) {
        if (contact && poseY<775) {
          poseY +=0.5;
        } else {
          keyCode = 0;
        }
      }
    }
  }
}
