// GUI CREATION **************************************************************************************************************
boolean saveAndSeed = false;
boolean createList = false;
boolean choiceLib = false;
boolean pivDoor = false;
boolean pivWindow = false;
boolean pivMass = false;
boolean pivRadiator = false;
boolean pivSlidingWindow = false;




void initGUI(){
  
         buttonCon = new ControlP5(this);

    PFont pfont = createFont("Arial",20,true); // use true/false for smooth/no-smooth
        ControlFont font = new ControlFont(pfont,12);
        

      
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
       .setLabel("scene")
       .setId(1)
       ;
         buttonCon.getTab("attributes")
       .activateEvent(false)
       .setLabel("environnement")
       .setId(2)
       ;
         buttonCon.getTab("archetypes")
       .activateEvent(false)
       .setLabel("object  type")
       .setId(3)
       ;
         buttonCon.getTab("keyword")
       .activateEvent(false)
       .setLabel("keyword")
       .setId(4)
       ;
          
           
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

// SLIDERS 
/*
  range = buttonCon.addRange("rangeChair")
              .setLabel("Chairs")
             // disable broadcasting since setRange and setRangeValues will trigger an event
             .setBroadcast(false) 
             .setPosition(50,400)
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


// TOGGLE ATTRIBUTES

       buttonCon.addToggle("pivDoor")
         .setLabel("Door")
         .setColorForeground(color(255))
         .setColorActive(color(#BCA1A1))
         //.setColorBackground(color(188,161,161))
         .setPosition(10, 200)
         .setSize(100,20)
         .setValue(false)
         .getCaptionLabel().align(ControlP5.CENTER, ControlP5.CENTER)
         ;
      buttonCon.getTooltip().setDelay(500);
      buttonCon.getTooltip().register("pivDoor","recognise door");
      
        buttonCon.addToggle("pivWindow")
         .setLabel("window")
         .setColorForeground(color(255))
         .setColorActive(color(#BCA1A1))
         .setPosition(10, 230)
         .setSize(100,20)
         .setValue(false)
         .getCaptionLabel().align(ControlP5.CENTER, ControlP5.CENTER)
         ;
      buttonCon.getTooltip().setDelay(500);
      buttonCon.getTooltip().register("pivWindow","recognise window");
      
         buttonCon.addToggle("pivSlidingWindow")
         .setLabel("sliding window")
         .setColorForeground(color(255))
         .setColorActive(color(#BCA1A1))
         .setPosition(10, 260)
         .setSize(100,20)
         .setValue(false)
         .getCaptionLabel().align(ControlP5.CENTER, ControlP5.CENTER)
         ;
      buttonCon.getTooltip().setDelay(500);
      buttonCon.getTooltip().register("pivSlidingWindow","recognise sliding window");
      
          buttonCon.addToggle("pivRadiator")
         .setLabel("radiator")
         .setColorForeground(color(255))
         .setColorActive(color(#BCA1A1))
         .setPosition(10, 290)
         .setSize(100,20)
         .setValue(false)
         .getCaptionLabel().align(ControlP5.CENTER, ControlP5.CENTER)
         ;
      buttonCon.getTooltip().setDelay(500);
      buttonCon.getTooltip().register("pivRadiator","recognise radiator");
      
          buttonCon.addToggle("pivMass")
         .setLabel("generic mass")
         .setColorForeground(color(255))
         .setColorActive(color(#BCA1A1))
         .setPosition(10, 320)
         .setSize(100,20)
         .setValue(false)
         .getCaptionLabel().align(ControlP5.CENTER, ControlP5.CENTER)
         ;
      buttonCon.getTooltip().setDelay(500);
      buttonCon.getTooltip().register("pivMass","recognise mass");    
           
// TEXTE INPUT
       // input texte
          buttonCon.addTextfield("tags") 
       .setLabel("")     
       .setPosition(10,125)
       .setSize(100,20)
       .setAutoClear(true)
       .setColor(color(0,0,0))
       ;   
     
       // clear texte  
          buttonCon.addBang("clear")  
       .setLabel("clear tags")     
       .setPosition(10,100)
       .setSize(100,20)
       .getCaptionLabel().align(ControlP5.CENTER, ControlP5.CENTER)
       ;  
     
       
// CHECKBOX
 
       buttonCon.addToggle("choiceLib")
         .setLabel("  Personnal      Shared")
         .setColorForeground(color(198,18,18))
         .setColorBackground(color(188,161,161))
         .setPosition(10, 75)
         .setSize(100,20)
         .setValue(false)
         .setMode(ControlP5.SWITCH)
         .getCaptionLabel().align(-200, ControlP5.CENTER)
         ;
      buttonCon.getTooltip().setDelay(500);
      buttonCon.getTooltip().register("choiceLib","choice your furniture library");
   
      
      buttonCon.addToggle("toggle")
         .setLabel("            wireframe")
         .setColorForeground(color(198,18,18))
         .setColorBackground(color(188,161,161))
         .setPosition(width -100, 430)
         .setSize(20,20)
         .setValue(false)
         .getCaptionLabel().align(-200, ControlP5.CENTER)
         ;
      buttonCon.getTooltip().setDelay(500);
      buttonCon.getTooltip().register("toggle","activate wireframe view");
     

       buttonCon.addToggle("createList")
         .setLabel("            create list") // pas touché au blanc !
         .setColorForeground(color(198,18,18))
         .setColorBackground(color(188,161,161))
         .setPosition(width -100, 455)
         .setSize(20,20)
         .setValue(false)
         .getCaptionLabel().align(-200, ControlP5.CENTER)
         ;
      buttonCon.getTooltip().setDelay(500);
      buttonCon.getTooltip().register("createList","create a list of used object");
          

       buttonCon.addToggle("saveAndSeed")
         .setLabel("            Save & seed") // pas touché au blanc !
         .setColorForeground(color(198,18,18))
         .setColorBackground(color(188,161,161))
         .setPosition(width -100, 480)
         .setSize(20,20)
         .setValue(false)
         .getCaptionLabel().align(-200, ControlP5.CENTER)
         ;
      buttonCon.getTooltip().setDelay(500);
      buttonCon.getTooltip().register("saveAndSeed","new seed at each save");
      
      
       buttonCon.addToggle("setCamera")
         .setLabel("            set camera") // pas touché au blanc !
         .setColorForeground(color(198,18,18))
         .setColorBackground(color(188,161,161))
         .setPosition(width -100, 505)
         .setSize(20,20)
         .setValue(false)
         .getCaptionLabel().align(-200, ControlP5.CENTER)
         ;
      buttonCon.getTooltip().setDelay(500);
      buttonCon.getTooltip().register("setCamera","set camera position");
           
// BUTTONS


          buttonCon.addBang("buttonTest")
       .setLabel("buttonTest")
       .setPosition(10,height -30)
       .setSize(80,20)
       .getCaptionLabel().align(ControlP5.CENTER, ControlP5.CENTER)
       ;
       
          buttonCon.addBang("buttonTest2")
       //.setLabel("buttonTest2")
     .setPosition(10,height -60)
       .setSize(80,20)
       .getCaptionLabel().align(ControlP5.CENTER, ControlP5.CENTER)
       ;
       
           buttonCon.getController("buttonTest2")
     .getCaptionLabel()
     .setFont(font)
     .toUpperCase(false)
     .setSize(24)
     .setFont(font)
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
       
       
      
       
       

       
       
// POSITION DES BUTTONS DANS LES TABS
       buttonCon.getController("randomizer").moveTo("global"); // global toujours visible
       buttonCon.getController("loadDisposition").moveTo("global"); 
       buttonCon.getController("saveDisposition").moveTo("global");
       buttonCon.getController("exportImage").moveTo("global");
       buttonCon.getController("exportObj").moveTo("global");
       buttonCon.getController("toggle").moveTo("global");
       buttonCon.getController("setCamera").moveTo("global");
       buttonCon.getController("saveAndSeed").moveTo("global");
       buttonCon.getController("createList").moveTo("global");


       buttonCon.getController("pivDoor").moveTo("attributes");     
       buttonCon.getController("pivWindow").moveTo("attributes");     
       buttonCon.getController("pivSlidingWindow").moveTo("attributes");     
       buttonCon.getController("pivMass").moveTo("attributes");     
       buttonCon.getController("pivRadiator").moveTo("attributes");            
              
       //buttonCon.getController("accordionPiv").moveTo("attributes");        
       buttonCon.getController("buttonTest").moveTo("global");
       buttonCon.getController("buttonTest2").moveTo("global");
       
       buttonCon.getController("sliderChair").moveTo("archetypes");
       buttonCon.getController("sliderShelf").moveTo("archetypes");
       buttonCon.getController("sliderCoffeeTable").moveTo("archetypes");
       buttonCon.getController("sliderTable").moveTo("archetypes");
       buttonCon.getController("sliderSofa").moveTo("archetypes");
       buttonCon.getController("sliderDesk").moveTo("archetypes");     
   
       buttonCon.getController("choiceLib").moveTo("keyword");      
       buttonCon.getController("tags").moveTo("keyword");
       buttonCon.getController("clear").moveTo("keyword");
         
       buttonCon.setAutoDraw(false); // pour eviter que le button soit inscrit dans le mouvement de caméra

} // fin void initGUI



// GUI EVENT **************************************************************************************************************



// void qui controle l'impact des buttons
void controlEvent(ControlEvent theEvent) { // obligatoire

// TODO: refaire tes event avec le formalisme suivant.
//  if (theEvent.isFrom(cp5.getController("n1"))) {
  
  
  /*
  for(int i=0; i<listFurniture.size(); i++) {
    if (theEvent.isFrom(cp5.getController("" + i + ": " + listFurniture.get(i).name)))
  }
  */
  
  
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
      println( buttonCon.getController("sliderChair").getValue() );
  }
  
  
//    if(theEvent.controller().name()=="rangeController") {
    // min and max values are stored in an array.
    // access this array with controller().arrayValue().
    // min is at index 0, max is at index 1.
    //colorMin = int(theControlEvent.getController().getArrayValue(0));
    //colorMax = int(theControlEvent.getController().getArrayValue(1));
  //  println("range update, done.");
 // }
  
  
 if(theEvent.controller().name()=="loadDisposition") {
//   saveFrame("project-####.png");
//      print("image saved");
    loadScene("test.xml");
     print("disposition loaded"); 
  }
  
  if(theEvent.controller().name()=="exportImage") {
     if(saveAndSeed==true){ // SI LE CHECKBOX SAVEANDSEED
        seed();
        saveFrame("export/project-####.png");
        print("image exported and new seed generated");       
     } else {
        saveFrame("export/project-####.png");
        print("image exported");
     }
     if(createList==true){ // SI LE CHECKBOX CREATE LIST
            String words = "apple bear cat dog";
            String[] list = split(words, ' ');
            saveStrings("export/list.txt", list);  
            print("list created ");    
     }
  }
 
 
 if(theEvent.controller().name()=="exportObj") {
     if(createList==true){  // SI LE CHECKBOX CREATE LIST
            String words = "apple bear cat dog";
            String[] list = split(words, ' ');
            saveStrings("export/list.txt", list);  
            print("list created ");    
     } else {
        print(".obj saved");
     }
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

