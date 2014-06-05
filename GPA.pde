import peasy.test.*;
import peasy.org.apache.commons.math.*;
import peasy.*;
import peasy.org.apache.commons.math.geometry.*;
import processing.opengl.*;
import saito.objloader.*;
import controlP5.*;
import processing.dxf.*;

ControlP5 buttonCon; // déclare mes buttons
PeasyCam cam; // déclare ma caméra

OBJModel model; // model appartement

ArrayList<Furniture> listFurniture;
ArrayList<Furniture> listPivot;

ArrayList<String> ChairName, SofaName, TableName, CoffeeTableName, ShelfName; // tabeau noms des fichiers .obj


float[] rotOr = new float[4]; // tableau rotation orthogonale
int xGeneral; // valeur box 
int yGeneral; // valeur box 
int nbChair;
int sliderChair = 0;
int sliderSofa = 0;
int sliderShelf = 0;
int sliderTable = 0;
int sliderCoffeeTable = 0;

String tags = ""; // pour le texte input

// SETUP **************************************************************************************************************

void setup() {

  size(displayWidth - 100,displayHeight - 100,OPENGL);
  noSmooth();

xGeneral = 410; // valeur box 
yGeneral = 560; 
    
    
  initGUI(); // intialise la GUI

  cam();
  seed(); // crée une nouvelle seed générative au lancement de la scène

  model = new OBJModel(this, "appartement6.obj", "relative", POLYGON); // APPARTEMENT
          model.scale(100);
          model.enableTexture();
         // model.disableMaterial();  //mesh view
          model.translateToCenter();


  
// TABLEAU .obj name

//Database for the furnitures
   ChairName = new ArrayList<String>();
   ChairName.add("chair5");
   ChairName.add("chair6");
   ChairName.add("chair7");
   
   TableName = new ArrayList<String>();
   //TableName.add("table1");
   //TableName.add("table2");
   //TableName.add("table3");
   //TableName.add("table4");
   TableName.add("table6");   
   SofaName = new ArrayList<String>();
   SofaName.add("sofa1");
   SofaName.add("sofa2");
   SofaName.add("sofa3");
   
   ShelfName = new ArrayList<String>();
   ShelfName.add("shelf1");
   ShelfName.add("shelf4");
   ShelfName.add("shelf5");
   ShelfName.add("shelf6");
   
   CoffeeTableName = new ArrayList<String>();
   CoffeeTableName.add("coffeeTable1");
   CoffeeTableName.add("coffeeTable2");
   CoffeeTableName.add("coffeeTable3");
  
   rotOr(); //rotation orthogonale  
} 



// DRAW **************************************************************************************************************
void draw() {
  background(255); 
  

 
    
// ROTATION CAMERA INTIALE
  rotateX(45); 
  rotateZ(45);
  
  //Display BOX (DEBUG)
  //box(410, 560, 2);


  //Display APPARTEMENT
  stroke(120);
  noFill();

  pushMatrix();  
    rotateX(-PI/2);
    translate(0,-120,0);
    model.draw();
  popMatrix();     
 
  
  //Display Furnitures
  for(int i=0; i< listFurniture.size(); i++) {
    
    pushMatrix();
    
      translate(listFurniture.get(i).position.x, listFurniture.get(i).position.y, listFurniture.get(i).box3D.y/2);
      rotateZ(listFurniture.get(i).rotation);
      rotateX(-PI/2); // remettre droit
  
      noStroke();
      listFurniture.get(i).model.draw(); // dessiner model
       
      // BOUNDING BOX
      //listFurniture.get(i).drawCorners(); // dessiner sphere de bounding box
      //stroke(150);
      //noFill();
      //chairs.get(i).bboxTemp.draw();
     
    popMatrix();     
 
  }  
  

// GUI **********
  disableCam(); // enleve la camera
  
  inputTextField(); // permet de dessiner les keywords
  gui(); // GUI reste au premier plan, on lui dit de dessiner en dernier
  
  enableCam();
// **************
}





