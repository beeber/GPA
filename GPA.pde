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

ArrayList<String> ChairName, SofaName, TableName, CoffeeTableName, ShelfName; // tabeau noms des fichiers .obj


float[] rotOr = new float[4]; // tableau rotation orthogonale
int a; // valeur box 
int nbChair;
int sliderChair = 0;
String textValue = ""; // pour le texte input


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
   ChairName = new ArrayList<String>();
   ChairName.add("chair5.obj");
   ChairName.add("chair6.obj");
   ChairName.add("chair7.obj");
   ChairName.add("chair8.obj");
   
   TableName = new ArrayList<String>();
   TableName.add("table1.obj");
   TableName.add("table2.obj");
   TableName.add("table3.obj");
   
   SofaName = new ArrayList<String>();
   SofaName.add("sofa1.obj");
   SofaName.add("sofa2.obj");
   SofaName.add("sofa3.obj");
   
   ShelfName = new ArrayList<String>();
   ShelfName.add("shelf1.obj");
   ShelfName.add("shelf2.obj");
   ShelfName.add("shelf3.obj");
   
   CoffeeTableName = new ArrayList<String>();
   CoffeeTableName.add("coffeeTable1.obj");
   CoffeeTableName.add("coffeeTable2.obj");
   CoffeeTableName.add("coffeeTable3.obj");
  
   rotOr(); //rotation orthogonale  
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





