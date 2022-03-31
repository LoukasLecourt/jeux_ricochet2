// Initialisation des variables globales
Personnage persoBleu, persoJaune, persoVert, persoRouge;
Hud hud;
Mur [] mur= new Mur[25];
Plateau plateau;
Table table;
boolean fin  = false;
String objectifAleatoire = str(int(random(1, 17)));
Chrono chrono;
PFont police; // Mise en plce d'une nouvel police d'écriture
String persoSelectionne = "jaune";

// Musique
import ddf.minim.*;  // Aller à Esquisse > Importation Bibliothèque... > Ajouter à la Bibliothèque... > Minim
AudioPlayer player;
Minim minim;

void setup() {
  size(1200, 800);
  background(200);
  frameRate(30);
  police = loadFont("Uroob-Regular-48.vlw");
  table = loadTable("base_de_données.csv", "header");
  plateau = new Plateau();

  // Initialisation des personnages
  persoBleu = new Personnage("bleu");
  persoJaune = new Personnage("jaune");
  persoVert = new Personnage("vert");
  persoRouge = new Personnage("rouge");

  // Initialise un hud
  hud = new Hud();

  // Initialisation du chrono et activation.
  chrono = new Chrono();
  chrono.activer();

  //Initialisation différents murs
  mur[0] = new Mur(772, 98, "Simple1");
  mur[1] = new Mur(772, 600, "Simple1");
  mur[2] = new Mur(26, 550, "Simple1");
  mur[3] = new Mur(26, 248, "Simple1");
  mur[4] = new Mur(248, 772, "Simple2");
  mur[5] = new Mur(600, 772, "Simple2");
  mur[6] = new Mur(200, 25, "Simple2");
  mur[7] = new Mur(450, 25, "Simple2");
  mur[8] = new Mur(373, 280, "Double1");
  mur[9] = new Mur(220, 478, "Double1");
  mur[10] = new Mur(672, 478, "Double1");
  mur[11] = new Mur(625, 325, "Double1");
  mur[12] = new Mur(279, 125, "Double4");
  mur[13] = new Mur(480, 575, "Double4");
  mur[14] = new Mur(180, 725, "Double4");
  mur[15] = new Mur(680, 74, "Double4");
  mur[16] = new Mur(470, 174, "Double3");
  mur[17] = new Mur(72, 323, "Double3");
  mur[18] = new Mur(522, 725, "Double3");
  mur[19] = new Mur(322, 523, "Double3");
  mur[20] = new Mur(730, 220, "Double2");
  mur[21] = new Mur(80, 670, "Double2");
  mur[22] = new Mur(730, 670, "Double2");
  mur[23] = new Mur(128, 221, "Double2");

  // Lancement de la musique
  minim = new Minim(this);
  player = minim.loadFile("musique_ricochet.mp3", 2048);
  player.play();
}

void draw() {
  // mesure le temps passé dans le jeux
  chrono.chronometre();

  // Selection des personnages
  if (mousePressed && (mouseX > persoBleu.getX()-20) && (mouseX < persoBleu.getX()+20) && (mouseY > persoBleu.getY()-20) && (mouseY  < persoBleu.getY()+20)) {
    persoSelectionne = "bleu";
  }
  if (mousePressed && (mouseX > persoJaune.getX()-20) && (mouseX < persoJaune.getX()+20) && (mouseY > persoJaune.getY()-20) && (mouseY  < persoJaune.getY()+20)) {
    persoSelectionne = "jaune";
  }
  if (mousePressed && (mouseX > persoVert.getX()-20) && (mouseX < persoVert.getX()+20) && (mouseY > persoVert.getY()-20) && (mouseY  < persoVert.getY()+20)) {
    persoSelectionne = "vert";
  }
  if (mousePressed && (mouseX > persoRouge.getX()-20) && (mouseX < persoRouge.getX()+20) && (mouseY > persoRouge.getY()-20) && (mouseY  < persoRouge.getY()+20)) {
    persoSelectionne = "rouge";
  }

  if (fin == false) {
    background(200);

    // Mouvement des personnages
    for (int i=0; i<mur.length-1; i++) {
      persoBleu.mouv(persoSelectionne, persoBleu.contact(mur[i].getX(), mur[i].getY()));
      persoRouge.mouv(persoSelectionne, persoRouge.contact(mur[i].getX(), mur[i].getY()));
      persoVert.mouv(persoSelectionne, persoVert.contact(mur[i].getX(), mur[i].getY()));
      persoJaune.mouv(persoSelectionne, persoJaune.contact(mur[i].getX(), mur[i].getY()));
      if (i==mur.length-1) {
        i=0;
      }
    }

    // Dessine la partie fix du plateau
    plateau.dessiner_fond();
    plateau.dessiner_bordure();
    plateau.dessiner_centre(objectifAleatoire);

    // Met en place l'affichage de toute les informations necessaire au jeux
    hud.dessiner_hud(persoSelectionne);
    hud.setSec(chrono.getSeconde() );
    hud.setMin(chrono.getMinute());

    for (int i=0; i<mur.length-1; i++) {
      mur[i].dessinerMurs();
    }

    // Integration des personnages
    persoBleu.dessinerPerso();
    persoJaune.dessinerPerso();
    persoVert.dessinerPerso();
    persoRouge.dessinerPerso();
  } else {
    // Sauvegarde des resultats dans la base de données si le jeux est terminé
    TableRow ligne = table.addRow(); // Ajoute une nouvelle ligne à la base
    // Ajoute les valeurs de la ligne
    ligne.setString("ID", "2");
    ligne.setString("nb_coups", "kikou");
    ligne.setString("temps", "ui");
    ligne.setString("liste_coups", "0ze");
    saveTable(table, "base_de_données.csv"); // Sauveguarde la base de données
    noLoop();
  }
}
