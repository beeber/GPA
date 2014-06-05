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


ArrayList<Furniture> listFurniture;
ArrayList<Furniture> listPivot;

ArrayList<String> ChairName, SofaName, TableName, CoffeeTableName, ShelfName; // tabeau noms des fichiers .obj


float[] rotOr = new float[4]; // tableau rotation orthogonale
int a; // valeur box 
int nbChair;
int sliderChair = 0;
int sliderSofa  = 0;
int sliderShelf = 0;
int sliderTable = 0;
int sliderCoffeeTable = 0;

String tags = ""; // pour le texte input
XML catalog;

// SETUP **************************************************************************************************************
void setup() {

  size(displayWidth - 100,displayHeight - 100,OPENGL);
  noSmooth();
  
  initGUI(); // intialise la GUI

  cam();
  seed(); // crée une nouvelle seed générative au lancement de la scène
  
  a = 500; // taille boite fond
  
// TABLEAU .obj name

//Database for the furnitures

  catalog = loadXML("catalog.xml");
  
   /*
   ChairName = new ArrayList<String>();
   ChairName.add("chair5");
   ChairName.add("chair6");
   ChairName.add("chair7");
   
   TableName = new ArrayList<String>();
   TableName.add("table1");
//   TableName.add("table2");
//   TableName.add("table3");
   
   SofaName = new ArrayList<String>();
   SofaName.add("sofa1");
   SofaName.add("sofa2");
   SofaName.add("sofa3");
   
   ShelfName = new ArrayList<String>();
   ShelfName.add("shelf1");
   ShelfName.add("shelf2");
   ShelfName.add("shelf3");
   
   CoffeeTableName = new ArrayList<String>();
   CoffeeTableName.add("coffeeTable1");
   CoffeeTableName.add("coffeeTable2");
   CoffeeTableName.add("coffeeTable3");
  */

  rotOr[0]= PI/2;
  rotOr[1]= PI;
  rotOr[2]= 3*PI/2;
  rotOr[3]= 2*PI;
} 



// DRAW **************************************************************************************************************
void draw() {
  background(255); 
    
    
// ROTATION CAMERA INTIALE
  rotateX(45); 
  rotateZ(45);

// BOX
  fill(100); 
  box(a, a, 2);


  parsingList();

// GUI **********
  disableCam(); // enleve la camera
  
  inputTextField(); // permet de dessiner les keywords
  gui(); // GUI reste au premier plan, on lui dit de dessiner en dernier
  
  enableCam();
// **************
}





