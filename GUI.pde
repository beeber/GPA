// GUI CREATION **************************************************************************************************************

void initGUI(){
  
         buttonCon = new ControlP5(this);
  
  
// COLOR GUI
      //buttonCon.setColorBackground(0xff4e4e4e);
      //buttonCon.setColorLabel(color(255, 255, 255));
      //buttonCon.setColorForeground(240);
      //buttonCon.setColorActive(color(198, 18, 48));
      
  
// FRAMERATE
        buttonCon.addFrameRate().setInterval(10).setPosition(0,height - 10)
        .moveTo("global"); // toujours onTop
        ;
        
// TABS
      // add une nouvelle tab
         buttonCon.addTab("attributes") 
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
       
       // "appelle" les différentes tabs
         buttonCon.getTab("default") 
       .activateEvent(false)
       .setLabel("files")
       .setId(1)
       ;
         buttonCon.getTab("attributes")
       .activateEvent(false)
       .setLabel("attributes")
       .setId(2)
       ;
         buttonCon.getTab("archetypes")
       .activateEvent(false)
       .setLabel("archetypes")
       .setId(3)
       ;
         buttonCon.getTab("keyword")
       .activateEvent(false)
       .setLabel("keyword")
       .setId(4)
       ;


  
// SLIDERS
         buttonCon.addSlider("sliderChair")
       .setLabel("Chairs")
       .setPosition(10,200)
       .setSize(100,20)
       .setRange(0,10)
       .setNumberOfTickMarks(11) // nombre de tick
       .setSliderMode(Slider.FIX) // fix = barre / flexible = main
          .getCaptionLabel().align(ControlP5.CENTER, ControlP5.CENTER)
       ;
      buttonCon.getTooltip().setDelay(500);
      buttonCon.getTooltip().register("sliderChair","Changes the number of Chair.");
  
// CHECKBOX
       buttonCon.addCheckBox("checkBox")
        .setPosition(width -100, 455)
        .setColorForeground(color(120))
        .setSize(20, 20)
        .setSpacingRow(5)
        .addItem("create list", 0)
        .addItem("save & seed", 0)
        .addItem("set camera", 0)
        .moveTo("global"); // toujours onTop
        ;
       buttonCon.getTooltip().setDelay(500);
       buttonCon.getTooltip().register("create list","create a list of used object");
       buttonCon.getTooltip().register("save & seed","create a new seed at each save");
       buttonCon.getTooltip().register("set camera","save camera position");
           
// BUTTONS
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
       
       // input texte
          buttonCon.addTextfield("textValue")       
       .setLabel("enter tags")
       .setPosition(10,100)
       .setSize(200,20)
       .setAutoClear(true)
       //.setColor(color(255,0,0))
       ;   
     
       // clear texte  
          buttonCon.addBang("clear")       
       .setPosition(210,100)
       .setSize(80,20)
       .getCaptionLabel().align(ControlP5.CENTER, ControlP5.CENTER)
       ;  
       
       
// POSITION DES BUTTONS DANS LES TABS
       buttonCon.getController("randomizer").moveTo("global"); // global toujours visible
       buttonCon.getController("saveImg").moveTo("global"); 
       buttonCon.getController("saveObj").moveTo("global");
       buttonCon.getController("addChair").moveTo("archetypes");
       buttonCon.getController("removeChair").moveTo("archetypes");
       buttonCon.getController("sliderChair").moveTo("archetypes");
       buttonCon.getController("textValue").moveTo("keyword");
       buttonCon.getController("clear").moveTo("keyword");
         
       buttonCon.setAutoDraw(false); // pour eviter que le button soit inscrit dans le mouvement de caméra

} // fin void initGUI



// GUI EVENT **************************************************************************************************************



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


// GUI UTILITAIRES **************************************************************************************************************



void inputTextField(){ // permet de dessiner l'input de keyword
  
  disableCam(); // enleve la camera

  fill(255);
  text(textValue, 10,300);
  text(buttonCon.get(Textfield.class,"textValue").getText(), 10,300);
  
  gui(); // GUI reste au premier plan, on lui dit de dessiner en dernier
  
  enableCam();
}



// permet à la GUI de rester au premier plan
void gui(){ 
  buttonCon.draw();
}



// bouton input texte
public void clear() {
  buttonCon.get(Textfield.class,"textValue").clear();
}

