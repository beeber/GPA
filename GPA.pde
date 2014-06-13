import peasy.*;
import saito.objloader.*;
import controlP5.*;
import processing.dxf.*;

ControlP5 buttonCon; // déclare mes buttons
PeasyCam cam; // déclare ma caméra
Accordion accordion;
Range range;
OBJModel model; // model appartement

int indexFurniture;
ArrayList<Furniture> listFurniture;

ArrayList<String> ChairName, SofaName, TableName, CoffeeTableName, ShelfName; // tabeau noms des fichiers .obj

float[] rotOr = new float[4]; // tableau rotation orthogonale
int xGeneral; // valeur box 
int yGeneral; // valeur box 
int nbChair;
int sliderChair = 0;
int sliderSofa  = 0;
int sliderShelf = 0;
int sliderTable = 0;
int sliderCoffeeTable = 0;

String tags = ""; // pour le texte input
catalog myCat;

int colorBox;// valeur couleur boxPivot A
int colorBox2;
color hoverColor = color(0, 230, 150); // DEFINI COULEUR BOX
boolean toggle = false;
boolean setCamera = false;
// SETUP **************************************************************************************************************

void setup() {

  size(displayWidth - 100, displayHeight - 100, OPENGL);
  smooth();

  xGeneral = 410; yGeneral = 560; 
  
  colorBox = 120; // valeur couleur boxPivot A
  colorBox2 = 80; // valeur couleur boxPivot B
   
  initGUI(); // intialise la GUI

  cam();
  
  indexFurniture = -1;
  listFurniture = new ArrayList<Furniture>();

  model = new OBJModel(this, "appartement8.obj", "relative", POLYGON); // APPARTEMENT
          model.scale(100);
          model.enableTexture();
          //model.disableMaterial();  //mesh view
          model.translateToCenter();
          model.disableDebug();
 
  
  myCat = new catalog("catalog.xml");
  
  rotOr[0]= PI/2; rotOr[1]= PI; rotOr[2]= 3*PI/2; rotOr[3]= 2*PI;
  
} 


void draw() {
  background(255); 
  
  // ROTATION CAMERA INTIALE
 // rotateX(45); 
 // rotateZ(45);

  //Display BOX (DEBUG)
  //box(410, 560, 2);

  //Display room
  stroke(0);
  pushMatrix();
     if(key == '-') {stroke(255);} 
     if(key == '*') {stroke(0);} 
    rotateX(-PI/2);
    translate(0,-120,0);
    model.draw();
  popMatrix(); 
  
  boxPivot(); // pour afficher les box des points pivot en couleur


// *************
// bouton wireframe
if(toggle==true) {
  model.shapeMode(LINES);
  } else {
   model.shapeMode(POLYGON);
}
// bouton set camera
if(setCamera == true){
  cam.setActive(false);
  println(cam);
  } else {
  cam.setActive(true);
}
// *************

  
//Display Furnitures
  for(int i=0; i< listFurniture.size(); i++) {
    pushMatrix();    
      translate(listFurniture.get(i).position.x, listFurniture.get(i).position.y, listFurniture.get(i).box3D.y/2);
      rotateZ(rotOr[ listFurniture.get(i).rotId ]);
      rotateX(-PI/2); // remettre droit
  
      noStroke();
      
      listFurniture.get(i).model.draw(); // dessiner model
      listFurniture.get(i).model.disableDebug();
      listFurniture.get(i).model.enableMaterial();
      listFurniture.get(i).model.enableTexture();
 
      if(listFurniture.get(i).pivot) {
        listFurniture.get(i).drawCorners(); // dessiner sphere de bounding box
      }
 
      if(indexFurniture == i) {
        //listFurniture.get(i).drawCorners(); // dessiner sphere de bounding box
        stroke(200,40,40);   noFill();
        listFurniture.get(i).bboxTemp.draw();
      }
    popMatrix();    
  }  
  
  
  //DEBUG
  /*
  for(int i=0; i< listFurniture.size(); i++)
  for(int j=i+1; j< listFurniture.size(); j++)
     if(isColliding(listFurniture.get(i), listFurniture.get(j))) {
       fill(255,0,0);
       box(10);
     }
  */

// GUI **********
  disableCam(); // enleve la camera
  
  inputTextField(); // permet de dessiner les keywords
  gui(); // GUI reste au premier plan, on lui dit de dessiner en dernier
  
  enableCam();
// **************

}


void keyPressed() {
 
 if(key == 'e')
   indexFurniture = min(indexFurniture + 1, listFurniture.size() -1);
   
 if(key == 'd')
   indexFurniture = max(indexFurniture - 1, -1);
   
 if(key == 'c' && indexFurniture > -1) {
   listFurniture.get(indexFurniture).pivot = !listFurniture.get(indexFurniture).pivot;
   
   //TODO: MODIFIER LA VALEUR DU SLIDER DEPENDANT DE L'ARCHETYPE.  (setValue());
 }
   
   
   
  if (key == CODED)
    switch(keyCode) {
     case UP:    listFurniture.get(indexFurniture).position.x += 10; break;
     case DOWN:  listFurniture.get(indexFurniture).position.x -= 10; break;
     case LEFT:  listFurniture.get(indexFurniture).position.y += 10; break;
     case RIGHT: listFurniture.get(indexFurniture).position.y -= 10; break;
    }
 
}




