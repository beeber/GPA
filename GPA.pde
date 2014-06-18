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

  size(displayWidth - 50, displayHeight - 50, OPENGL);
  smooth();

  xGeneral = 410; yGeneral = 560; 
  
  colorBox = 120; // valeur couleur boxPivot A
  colorBox2 = 80; // valeur couleur boxPivot B
   
  initGUI(); // intialise la GUI

  cam();
  
  indexFurniture = -1;
  listFurniture = new ArrayList<Furniture>();

  seed(); // crée une nouvelle seed générative au lancement de la scène

  // DISPLAY APPARTMENT
  model = new OBJModel(this, "data/appartement8.obj", "relative", POLYGON);

          model.scale(100);
          //model.enableTexture();
          //model.disableMaterial();  //mesh view
          model.translateToCenter();
          model.disableDebug();

  // CREATION POINT PIVOT
  Furniture furT;
  
  //Porte fenetre
  furT = new Furniture(this);
  furT.name = "Fenetre";
  furT.type = Archetype.PIVOT_STD;
  furT.position = new PVector(-215,-150,110);
  furT.rotId = 0;
  furT.box3D = new PVector(20,160,220);
  furT.pivot = true;
  listFurniture.add(furT);
  
  // porte
  furT = new Furniture(this); 
  furT.name = "Porte";
  furT.type = Archetype.PIVOT_STD;
  furT.position = new PVector(215,157,105);
  furT.rotId = 0;
  furT.box3D = new PVector(20,85,210);
  furT.pivot = true;
  listFurniture.add(furT);
  
  // bloc
    furT = new Furniture(this);
  furT.name = "Block";
  furT.type = Archetype.PIVOT_STD;
  furT.position = new PVector(198,75,134);
  furT.rotId = 0;
  furT.box3D = new PVector(12,42,60);
  furT.pivot = true;
  listFurniture.add(furT);
  
  // Radiateur
    furT = new Furniture(this);
  furT.name = "Radiateur";
  furT.type = Archetype.PIVOT_STD;
  furT.position = new PVector(140,265,50);
  furT.rotId = 0;
  furT.box3D = new PVector(125,30,100);
  furT.pivot = true;
  listFurniture.add(furT);
  
  // fenetre
      furT = new Furniture(this);
  furT.name = "Fenetre";
  furT.type = Archetype.PIVOT_STD;
  furT.position = new PVector(-10,290,150);
  furT.rotId = 0;
  furT.box3D = new PVector(135,20,120);
  furT.pivot = true;
  listFurniture.add(furT);
  
 
  
  myCat = new catalog("catalog.xml");
  
  rotOr[0]= PI/2; rotOr[1]= PI; rotOr[2]= 3*PI/2; rotOr[3]= 2*PI;
  
} 

void draw() {
  background(255); 
 //lights();
 //pointLight(51, 102, 126, 35, 40, 36);
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
 
 
// DISPLAY FURNITURES
  for(int i=0; i< listFurniture.size(); i++) {
    
    if(listFurniture.get(i).type == Archetype.PIVOT_STD) { // RAJOUTER AU TEST (avec &&) des conditions pour l'affichage. (moi qui fait)
     
     pushMatrix();
       translate(listFurniture.get(i).position.x, listFurniture.get(i).position.y, listFurniture.get(i).position.z);
       if(indexFurniture == i) {
         stroke(200,40,40);   fill(200,40,40,30);
         box(listFurniture.get(i).box3D.x, listFurniture.get(i).box3D.y, listFurniture.get(i).box3D.z);
       }
     popMatrix();
     
    } else {
      
      pushMatrix();    
        translate(listFurniture.get(i).position.x, listFurniture.get(i).position.y, listFurniture.get(i).box3D.y/2);
        rotateZ(rotOr[ listFurniture.get(i).rotId ]);
        rotateX(-PI/2); // put everything straight
    
       //noStroke();
       stroke(0);

       listFurniture.get(i).model.disableDebug();
       listFurniture.get(i).model.draw();
   
        if(listFurniture.get(i).pivot) {
          listFurniture.get(i).drawCorners(); // dessiner sphere de bounding box
        }
        
      if(indexFurniture == i) {
        //listFurniture.get(i).drawCorners(); // dessiner sphere de bounding box
        stroke(200,40,40);   fill(200,40,40,30);
        listFurniture.get(i).bboxTemp.draw();
      }
      
     popMatrix();
     
    }
      
  }  


// GUI **********
  //disableCam(); //

  if(buttonCon.window(this).isMouseOver()){
    cam.setActive(false);
  } else { 
    cam.setActive(true);
         if(setCamera==true){ // setCamera toggle
          cam.setActive(false);
          println("camera disable");
        } else {
          cam.setActive(true);
        }
  }
  
  inputTextField(); // keyword input
// gui();
//  enableCam();
// **************


  
}


void keyPressed() {
 /*
 if(key == 'u')
 println ("setGUI false");
  setGUI = !setGUI;
 */ 
 if(key == 'e')
   indexFurniture = min(indexFurniture + 1, listFurniture.size() -1);
   
 if(key == 'd')
   indexFurniture = max(indexFurniture - 1, -1);
   
 if(key == 'c' && indexFurniture > -1) {  
   
   listFurniture.get(indexFurniture).pivot = !listFurniture.get(indexFurniture).pivot;
   
   if(listFurniture.get(indexFurniture).pivot) { // was not a pivot : minus 1 on the slider
     if( buttonCon.getController("sliderChair").getValue() >0 )
      buttonCon.getController("sliderChair").setValue( buttonCon.getController("sliderChair").getValue() - 1);  
   } else {
    buttonCon.getController("sliderChair").setValue( buttonCon.getController("sliderChair").getValue() + 1);  
   }
   
 }
 /*
    if(key == ' ') {
        buttonCon.remove("accordionPiv"); 
         controlP5.Group g1 = buttonCon.addGroup("Door")
                .setBackgroundColor(color(0, 64))
                .setBackgroundHeight(10)
                .setBarHeight(20)
                ;
  buttonCon.addCheckBox("checkBoxDoor")
                .setPosition(10, 20)
                .setColorForeground(color(120))
                .setColorActive(color(255))
                .setColorLabel(color(255))
                .setSize(20, 20)
                .setItemsPerRow(2)
                .setSpacingColumn(70)
                .setSpacingRow(10)
                .addItem("entry point", 1)
                .addItem("can't be block 8", 50)
                //.addItem("sliding door", 100)
                //.activateAll()
                //.activate(3)
                .moveTo(g1)
                ;


  accordion = buttonCon.addAccordion("accordionPiv") // création accordion et placement des différents group inside
                 .setPosition(10,200)
                 .setWidth(200)
                 .addItem(g1)
                 ;
                 
    accordion.setCollapseMode(Accordion.SINGLE); 
      
    }
   */
   
  if (key == CODED)
    switch(keyCode) {
     case UP:    listFurniture.get(indexFurniture).position.x += 10; break;
     case DOWN:  listFurniture.get(indexFurniture).position.x -= 10; break;
     case LEFT:  listFurniture.get(indexFurniture).position.y += 10; break;
     case RIGHT: listFurniture.get(indexFurniture).position.y -= 10; break;
    }
 
}




