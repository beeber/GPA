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



//ArrayList<Furniture> furnitures;
ArrayList<Chair> chairs;

ArrayList<String> ChairName; // tabeau noms des fichiers .obj

float[] rotOr = new float[4]; // tableau rotation orthogonale
int a; // valeur box 
int nbChair;
int sliderChair = 0;
String textValue = ""; // pour le texte input

   // tableau du noms
 
 
void setup() {
  size(1200,600,OPENGL);
  noSmooth();

  // TABLEAU .obj name
   ChairName = new ArrayList<String>();   
   ChairName.add("chair1.obj");
   ChairName.add("chair2.obj");
   ChairName.add("chair3.obj");
   ChairName.add("chair4.obj");
  

   
  // GUI 
  buttonCon = new ControlP5(this);
       
      // framerate
        buttonCon.addFrameRate().setInterval(10).setPosition(0,height - 10);
      // tabs
         buttonCon.addTab("attributes") // add une nouvelle tab
       .setColorBackground(color(0, 160, 100))
       .setColorLabel(color(255))
       .setColorActive(color(255,128,0))
       ;
         buttonCon.addTab("archetypes") // 
       .setColorBackground(color(0, 160, 100))
       .setColorLabel(color(255))
       .setColorActive(color(255,128,0))
       ;
         buttonCon.addTab("keyword") // 
       .setColorBackground(color(0, 160, 100))
       .setColorLabel(color(255))
       .setColorActive(color(255,128,0))
       ;
       
         buttonCon.getTab("default") // "appelle" les différentes tabs
       .activateEvent(true)
       .setLabel("files")
       .setId(1)
       ;
         buttonCon.getTab("attributes")
       .activateEvent(true)
       .setLabel("attributes")
       .setId(2)
       ;
         buttonCon.getTab("archetypes")
       .activateEvent(true)
       .setLabel("archetypes")
       .setId(3)
       ;
         buttonCon.getTab("keyword")
       .activateEvent(true)
       .setLabel("keyword")
       .setId(4)
       ;
     
     // sliders
     
       buttonCon.addSlider("sliderChair")
     .setLabel("Chairs")
     .setPosition(10,200)
     .setSize(100,20)
     .setRange(0,10)
     .setNumberOfTickMarks(11) // nombre de tick
     .setSliderMode(Slider.FIX) // fix = barre / flexible = main
        .getCaptionLabel().align(ControlP5.CENTER, ControlP5.CENTER)
     ;
     
     // checkbox
     
       buttonCon.addCheckBox("checkBoxTxt")
        .setPosition(width -100, 455)
        .setColorForeground(color(120))
        //.setColorActive(color(255))
        //.setColorLabel(color(255))
        .setSize(20, 20)
        .addItem("create list", 0)
        ;

       buttonCon.addCheckBox("checkBoxSave")
        .setPosition(width -100,480)
        .setColorForeground(color(120))
        //.setColorActive(color(255))
        //.setColorLabel(color(255))
        .setSize(20, 20)
        .addItem("save & seed", 0)
        ;

       buttonCon.addCheckBox("checkBoxCam")
        .setPosition(width -100,505)
        .setColorForeground(color(120))
        //.setColorActive(color(255))
        //.setColorLabel(color(255))
        .setSize(20, 20)
        .addItem("set camera", 0)
        ;
        
          
     // button
               buttonCon.addBang("saveImg")
       .setLabel("save img")
       .setPosition(width -100,530)
       .setSize(80,20)
       .getCaptionLabel().align(ControlP5.CENTER, ControlP5.CENTER)
       ;
                  buttonCon.addBang("saveObj")
       .setLabel("save as model")
       .setPosition(width -100,555)
       .setSize(80,20)
       .getCaptionLabel().align(ControlP5.CENTER, ControlP5.CENTER)
       ;
       /*
       buttonCon.addBang("saveImgSeed")
       .setLabel("seed & save img ")
       .setPosition(width -185,555)
       .setSize(80,20)
       .getCaptionLabel().align(ControlP5.CENTER, ControlP5.CENTER)
       ;
       */

          buttonCon.addBang("randomizer")
       .setLabel("new seed")
       .setPosition(width -185,555)
       .setSize(80,20)
       .getCaptionLabel().align(ControlP5.CENTER, ControlP5.CENTER)
       ;
          buttonCon.addBang("addChair")
       .setLabel("add chair")
       .setPosition(20,100)
       .setSize(80,20)
       .getCaptionLabel().align(ControlP5.CENTER, ControlP5.CENTER)
       ;
          buttonCon.addBang("removeChair")
       .setLabel("remove chair")
       .setPosition(104,100)
       .setSize(80,20)
       .getCaptionLabel().align(ControlP5.CENTER, ControlP5.CENTER)
       ;
          buttonCon.addTextfield("input")       // input texte
       .setPosition(10,100)
       .setSize(200,20)
       .setFocus(true)
       .setColor(color(255,0,0))
       ;     
          buttonCon.addBang("clear")       // clear texte
       .setPosition(210,100)
       .setSize(80,20)
       .getCaptionLabel().align(ControlP5.CENTER, ControlP5.CENTER)
       ;  
       
       // positionne les buttons dans des tabs différentes
       buttonCon.getController("randomizer").moveTo("global"); // global toujours visible
       buttonCon.getController("saveImg").moveTo("global");
       
       //buttonCon.getController("checkBoxTxt").moveTo("global");
       //buttonCon.getController("checkBoxSave").moveTo("global");
       //buttonCon.getController("checkBoxCam").moveTo("global");
       //buttonCon.getController("saveImgSeed").moveTo("global");
       buttonCon.getController("saveObj").moveTo("global");
       buttonCon.getController("addChair").moveTo("archetypes");
       buttonCon.getController("removeChair").moveTo("archetypes");
       buttonCon.getController("sliderChair").moveTo("archetypes");
       buttonCon.getController("input").moveTo("keyword");
       buttonCon.getController("clear").moveTo("keyword");
         
  buttonCon.setAutoDraw(false); // pour eviter que le button soit inscrit dans le mouvement de caméra

  // rotation orthogonale
  rotOr[0]= -PI;
  rotOr[1]= PI/2;
  rotOr[2]= PI;
  rotOr[3]= 2*PI;

  // PEASYcam
  cam = new PeasyCam(this, 0, 0, 0, 800); // valeur de base du point visé (x,y,z, distance)
  cam.setMinimumDistance(500); // distance minimal et maximal de la cam par rapport au model
  cam.setMaximumDistance(5000);

  // taille boite fond
  a = 500;

  seed(); // crée une nouvelle seed générative au lancement de la scène
} 

void draw() {
  // rotation intiale pour la cam
  rotateX(45); 
  rotateZ(45);
  //println(sliderChair);
  background(0); 
  fill(100); // de la boite
  box(a, a, 2);

  // On parse la liste pour l'affichage
  for(int i=0; i< chairs.size(); i++) {
     pushMatrix();
      //On le bouge à sa place
      translate(chairs.get(i).position.x, chairs.get(i).position.y, chairs.get(i).box3D.y/2);
      rotateZ(chairs.get(i).rotation);
      rotateX(-PI/2); // remettre droit
      
      //On dessine
      noStroke();
      chairs.get(i).model.draw();
      
      stroke(150);
      noFill();
      chairs.get(i).bboxTemp.draw();
      popMatrix();     
  }  
  disableCam(); // enleve la camera
  // rapport bouton
  text(buttonCon.get(Textfield.class,"input").getText(), 360,130);
  text(textValue, 360,180);
  gui(); // GUI reste au premier plan, on lui dit de dessiner en dernier
  enableCam();
}


  // bouton input texte
public void clear() {
  buttonCon.get(Textfield.class,"input").clear();
}


// void qui controle l'impact des buttons
void controlEvent(ControlEvent theEvent) { // obligatoire

 if(theEvent.controller().name()=="randomizer") {  // concerne le button "randomizer"
      print("new seed generated");  
      seed(); // quand on clique, on crée une nouvelle seed();
 }
 if(theEvent.controller().name()=="addChair") { 
      nbChair = nbChair+1;
      print("new seed generated with additionnal chair");  
      seed(); 
  } 
  if(theEvent.controller().name()=="removeChair") { 
      nbChair = nbChair-1;
      print("new seed generated with additionnal chair");  
      seed(); 
  }
  if(theEvent.isAssignableFrom(Textfield.class)) { // concerne le button texte
    println("controlEvent: accessing a string from controller '"
            +theEvent.getName()+"': "
            +theEvent.getStringValue()
            );
  }  
 if(theEvent.controller().name()=="saveImg") { 
        saveFrame("project-####.png");
      print("image saved");  
  }
   if(theEvent.controller().name()=="saveImgSeed") { 
        saveFrame("project-####.png");
      print("image saved & new seed"); 
           seed();  
  }
}

// GENERATION PURE
void seed(){
   chairs = new ArrayList<Chair>(); // crée ou vide un tableau
   
  //On charge et "add" des models
  for(int i=0; i<sliderChair; i++) { 
    println(ChairName);
     chairs.add(new Chair(this,ChairName.get(int(random(0,4))) /* random sur le noms des .obj */,new PVector(random(-a/2,a/2),random(-a/2,a/2)),rotOr[int(random(3))]));
  }
}

void disableCam(){
  hint(DISABLE_DEPTH_TEST);
  cam.beginHUD();
}

void enableCam(){
   cam.endHUD();
  hint(ENABLE_DEPTH_TEST);
}


// permet à la GUI de rester au premier plan
void gui(){ 
  buttonCon.draw();
}

