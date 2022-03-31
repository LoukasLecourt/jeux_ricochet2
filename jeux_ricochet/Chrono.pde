class Chrono {
  // attributs.
  int seconde, minute, compteur, frame;
  boolean activation;

  // constructeurs.
  Chrono() {
    this.seconde = 0;
    this.minute = 0;
    this.compteur = 0;
    this.frame = 15;
    this.activation = false;
  }
  Chrono(int sec, int min, int imagesParSeconde, boolean act) {
    this.seconde = sec;
    this.minute = min;
    this.compteur = 0;
    this.frame = imagesParSeconde;
    this.activation = act;
  }

  // methodes.
  // permet de lancer le chrono.
  void activer() {
    activation = true;
  }

  // permet de desactiver le chrono.
  void desactiver() {
    activation = false;
  }

  // permet de renvoyer la variable seconde.
  int getSeconde() {
    return seconde;
  }

  // permet de renvoyer la variable minute.
  int getMinute() {
    return minute;
  }

  // le chrono compte les seconde en fonction des fps fixé.
  void chronometre() {
    if (activation == true) {
      compteur ++;
      if (compteur == frame) {
        compteur = 0;
        seconde ++;
        if (seconde == 60) {
          minute ++;
          seconde = 0;
        }
      }
    }
  }
}
