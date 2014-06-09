// GUI CREATION **************************************************************************************************************

void initGUI(){
  
         buttonCon = new ControlP5(this);
  
// COLOR GUI
      buttonCon.setColorBackground(#FFFFFC);
      buttonCon.setColorLabel(color(0));
      buttonCon.setColorForeground(#BCA1A1);
      buttonCon.setColorActive(color(198, 18, 48));
  
// FRAMERATE

        buttonCon.addFrameRate().setInterval(10).setPosition(0,height - 10)
               .setColor(0)
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
   
// ACCORDION ATTRIBUTE
/*
  Group accordion1 = buttonCon.addGroup("Door")
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
                .activateAll()
                //.activate(3)
                .moveTo(accordion1)
                ;


  Group accordion2 = buttonCon.addGroup("Window")
              .setBackgroundColor(color(0, 64))
              .setBackgroundHeight(20)
              .setBarHeight(20)
              ;
  buttonCon.addCheckBox("checkBoxWindow")
                .setPosition(10, 20)
                .setColorForeground(color(120))
                .setColorActive(color(255))
                .setColorLabel(color(255))
                .setSize(20, 20)
                .setItemsPerRow(2)
                .setSpacingColumn(70)
                .setSpacingRow(20)
                .addItem("light source", 0)
                .addItem("can't be block", 50)
                .addItem("entry point 2", 1)
                //.addItem("sliding window", 100)
                //.activate(10)
                .activateAll()
                .moveTo(accordion2)
                ;
                
  Group accordion3 = buttonCon.addGroup("Radiator")
              .setBackgroundColor(color(0, 64))
              .setBackgroundHeight(10)
              .setBarHeight(20)
              ;
  buttonCon.addCheckBox("checkBoxRadiator")
               .setPosition(10,20)
                   .setColorForeground(color(120))
                .setColorActive(color(255))
                .setColorLabel(color(255))
               .setItemWidth(20)
               .setItemHeight(20)
               .setItemsPerRow(2)
               .setSpacingRow(1)
               .setSpacingColumn(70)
               .addItem("mass", 0)
               .addItem("heat source", 1)
               //.addItem("sliding ", 2)
               .setColorLabel(color(255))
               .activateAll()
              // sssssssssssssssssssssssssssssssssssssssssssssdesactivate(1)
               .moveTo(accordion3)
               ;
     
   Group accordion14 = buttonCon.addGroup("Sliding Window")
              .setBackgroundColor(color(0, 64))
              .setBackgroundHeight(20)
              .setBarHeight(20)
              ;
  buttonCon.addCheckBox("checkBoxSlidingWindow")
                .setPosition(10, 20)
                .setColorForeground(color(120))
                .setColorActive(color(255))
                .setColorLabel(color(255))
                .setSize(20, 20)
                .setItemsPerRow(2)
                .setSpacingColumn(70)
                .setSpacingRow(20)
                .addItem("light source 2", 0)
                .addItem("can't be block 2", 50)
                .addItem("entry 2", 100)
                .activate(10)
                 .activateAll()
                .moveTo(accordion14)
                ;   
     
 
  accordion = buttonCon.addAccordion("accordionPiv") // création accordion et placement des différents group inside
                 .setPosition(40,40)
                 .setWidth(200)
                 .addItem(accordion11)             
                 .addItem(accordion12)
                 .addItem(accordion13)
                 .addItem(accordion14 )
                 ;
    accordion.setCollapseMode(Accordion.SINGLE);               
           
*/
// SLIDERS
/*
  range = buttonCon.addRange("rangeChair")
              .setLabel("Chairs")
             // disable broadcasting since setRange and setRangeValues will trigger an event
             .setBroadcast(false) 
             .setPosition(50,50)
             .setDecimalPrecision (0)
             .setSize(100,20)
             .setHandleSize(10)
             .setRange(0,10)
             .setRangeValues (0,0)
             // after the initialization we turn broadcast back on again
             .setBroadcast(true)
 
             .setColorForeground(color(255,40))
             .setColorBackground(color(255,40))  
             //.getCaptionLabel().align(ControlP5.CENTER, ControlP5.CENTER)
             ;
            buttonCon.getTooltip().setDelay(500);
            buttonCon.getTooltip().register("rangeChair","Changes the number of Chair.");
  */          
            
                     
             
         buttonCon.addSlider("sliderChair")
       .setLabel("Chairs")
     //.setDecimalPrecision (1)
       .setPosition(10,200)
       .setSize(100,20)
       .setRange(0,10)
       .setNumberOfTickMarks(11) // nombre de tick
       .setSliderMode(Slider.FIX) // fix = barre / flexible = main
       .getCaptionLabel().align(ControlP5.CENTER, ControlP5.CENTER)
       ;
      buttonCon.getTooltip().setDelay(500);
      buttonCon.getTooltip().register("sliderChair","Changes the number of Chair.");
    
         buttonCon.addSlider("sliderShelf")
       .setLabel("shelf")
       .setDecimalPrecision (1)
       .setPosition(10,230)
       .setSize(100,20)
       .setRange(0,10)
       .setNumberOfTickMarks(11) // nombre de tick
       .setSliderMode(Slider.FIX) // fix = barre / flexible = main
       .getCaptionLabel().align(ControlP5.CENTER, ControlP5.CENTER)
       ;
      buttonCon.getTooltip().setDelay(500);
      buttonCon.getTooltip().register("sliderShelf","Changes the number of shelf.");
      
         buttonCon.addSlider("sliderCoffeeTable")
       .setLabel("coffee table")
       .setDecimalPrecision (1)
       .setPosition(10,260)
       .setSize(100,20)
       .setRange(0,10)
       .setNumberOfTickMarks(11) // nombre de tick
       .setSliderMode(Slider.FIX) // fix = barre / flexible = main
          .getCaptionLabel().align(ControlP5.CENTER, ControlP5.CENTER)
       ;
      buttonCon.getTooltip().setDelay(500);
      buttonCon.getTooltip().register("sliderCoffeeTable","Changes the number of coffee table.");
      
               buttonCon.addSlider("sliderTable")
       .setLabel("table")
       .setDecimalPrecision (1)
       .setPosition(10,290)
       .setSize(100,20)
       .setRange(0,10)
       .setNumberOfTickMarks(11) // nombre de tick
       .setSliderMode(Slider.FIX) // fix = barre / flexible = main
          .getCaptionLabel().align(ControlP5.CENTER, ControlP5.CENTER)
       ;
      buttonCon.getTooltip().setDelay(500);
      buttonCon.getTooltip().register("sliderTable","Changes the number of table.");
      
               buttonCon.addSlider("sliderSofa")
       .setLabel("sofa")
       .setDecimalPrecision (1)
       .setPosition(10,320)
       .setSize(100,20)
       .setRange(0,10)
       .setNumberOfTickMarks(11) // nombre de tick
       .setSliderMode(Slider.FIX) // fix = barre / flexible = main
          .getCaptionLabel().align(ControlP5.CENTER, ControlP5.CENTER)
       ;
      buttonCon.getTooltip().setDelay(500);
      buttonCon.getTooltip().register("sliderSofa","Changes the number of sofa.");
      
                     buttonCon.addSlider("sliderDesk")
       .setLabel("desk")
       .setDecimalPrecision (0)
       .setPosition(10,350)
       .setSize(100,20)
       .setRange(0,10)
       .setNumberOfTickMarks(11) // nombre de tick
       .setSliderMode(Slider.FIX) // fix = barre / flexible = main
          .getCaptionLabel().align(ControlP5.CENTER, ControlP5.CENTER)
       ;
      buttonCon.getTooltip().setDelay(500);
      buttonCon.getTooltip().register("sliderDesk","Changes the number of desk.");
  
// CHECKBOX
       buttonCon.addCheckBox("checkBox")
        .setPosition(width -100, 455)
    
        .setColorForeground(color(198,18,18))
        .setColorBackground(color(188,161,161))
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

          buttonCon.addBang("buttonTest")
       .setLabel("buttonTest")
       .setPosition(100,530)
       .setSize(80,20)
       .getCaptionLabel().align(ControlP5.CENTER, ControlP5.CENTER)
       ;
       
          buttonCon.addBang("buttonTest2")
       .setLabel("buttonTest2")
       .setPosition(100,630)
       .setSize(80,20)
       .getCaptionLabel().align(ControlP5.CENTER, ControlP5.CENTER)
       ;
       
          buttonCon.addBang("loadDisposition")
       .setLabel("load disposition")
       .setPosition(width -100,530)
       .setSize(80,20)
       .getCaptionLabel().align(ControlP5.CENTER, ControlP5.CENTER)
       ;
          buttonCon.addBang("saveDisposition")
       .setLabel("save disposition")
       .setPosition(width -100,555)
       .setSize(80,20)
       .getCaptionLabel().align(ControlP5.CENTER, ControlP5.CENTER)
       ;
       
          buttonCon.addBang("exportImage")
       .setLabel("export as image")
       .setPosition(width -100,580)
       .setSize(80,20)
       .getCaptionLabel().align(ControlP5.CENTER, ControlP5.CENTER)
       ;
       
          buttonCon.addBang("exportObj")
       .setLabel("export as .Obj")
       .setPosition(width -100,605)
       .setSize(80,20)
       .getCaptionLabel().align(ControlP5.CENTER, ControlP5.CENTER)
       ;
       

          buttonCon.addBang("randomizer")
       .setLabel("new seed")
       .setPosition(width -185,555)
       .setSize(80,20)
       .getCaptionLabel().align(ControlP5.CENTER, ControlP5.CENTER)
       ;
       
       
      
       
       
       // input texte
          buttonCon.addTextfield("tags") 
          
       .setLabel("enter tags")
       .setPosition(10,100)
       .setSize(200,20)
       .setAutoClear(true)
       .setColor(color(0,0,0))
       ;   
     
       // clear texte  
          buttonCon.addBang("clear")       
       .setPosition(210,100)
       .setSize(80,20)
       .getCaptionLabel().align(ControlP5.CENTER, ControlP5.CENTER)
       ;  
       
       
// POSITION DES BUTTONS DANS LES TABS
       buttonCon.getController("randomizer").moveTo("global"); // global toujours visible
       buttonCon.getController("loadDisposition").moveTo("global"); 
       buttonCon.getController("saveDisposition").moveTo("global");
       buttonCon.getController("exportImage").moveTo("global");
       buttonCon.getController("exportObj").moveTo("global");
       
       buttonCon.getController("buttonTest").moveTo("attributes");
              buttonCon.getController("buttonTest2").moveTo("attributes");
       
       buttonCon.getController("sliderChair").moveTo("archetypes");
       buttonCon.getController("sliderShelf").moveTo("archetypes");
       buttonCon.getController("sliderCoffeeTable").moveTo("archetypes");
       buttonCon.getController("sliderTable").moveTo("archetypes");
       buttonCon.getController("sliderSofa").moveTo("archetypes");
        buttonCon.getController("sliderDesk").moveTo("archetypes");     
   
       
       buttonCon.getController("tags").moveTo("keyword");
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
 


  if(theEvent.isAssignableFrom(Textfield.class)) { // concerne le button texte
      println("controlEvent: accessing a string from controller '"
            +theEvent.getName()+"': "
            +theEvent.getStringValue()
            );
  }  
  
  
  
  
   if(theEvent.controller().name()=="buttonTest") {
//   saveFrame("project-####.png");
//      print("image saved");
    //loadScene("test.xml");
     print("CHANGEMENT COLOR***********************"); 
     colorBox = 30;
  }
  
     if(theEvent.controller().name()=="buttonTest2") {
//   saveFrame("project-####.png");
//      print("image saved");
    //loadScene("test.xml");
  }
  
  /*
    if(theEvent.controller().name()=="rangeController") {
    // min and max values are stored in an array.
    // access this array with controller().arrayValue().
    // min is at index 0, max is at index 1.
    //colorMin = int(theControlEvent.getController().getArrayValue(0));
    //colorMax = int(theControlEvent.getController().getArrayValue(1));
    println("range update, done.");
  }
  */

  
  
  
  
  
 if(theEvent.controller().name()=="loadDisposition") {
//   saveFrame("project-####.png");
//      print("image saved");
    loadScene("test.xml");
     print("disposition loaded"); 
  }
  
   if(theEvent.controller().name()=="exportImage") {
   saveFrame("project-####.png");
    print("image saved");
  }
  
     if(theEvent.controller().name()=="exportObj") {
   //saveFrame("project-####.png");
    print(".obj saved");
  }
  
  
  if(theEvent.controller().name()=="loadDispositionSeed") { 
      saveFrame("project-####.png");
      print("disposition load"); 
      seed();  
  }
  
   if(theEvent.controller().name()=="saveDisposition") { 
      saveScene("test.xml");
      print("disposition saved"); 

  }
}


// GUI UTILITAIRES **************************************************************************************************************



void inputTextField(){ // permet de dessiner l'input de keyword
  
  disableCam(); // enleve la camera

  fill(0);
  text(tags, 10,300);
  text(buttonCon.get(Textfield.class,"tags").getText(), 10,300);
  
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

