void seed(){
  
  int alreadyShelf = 0;
  int alreadyTable = 0;
  int alreadySofa = 0;
  int alreadyCoffeeTable = 0;
  int alreadyChair = 0;
  
  
  
  // 1) On instancie notre tableau A CLEANER
  int size = listFurniture.size();
  for (int i = size-1; i >= 0; i--){
    
      if (!listFurniture.get(i).pivot && !listFurniture.get(i).pivotPos & !listFurniture.get(i).pivotMob){
              listFurniture.remove(i);
      } else {
        
       switch(listFurniture.get(i).type) {
         case SHELF: alreadyShelf++; break;
         case TABLE: alreadyTable++; break;
         case SOFA:  alreadySofa++; break;
         case COFFEE_TABLE: alreadyCoffeeTable++; break;
         case CHAIR: alreadyChair++; break;
         default: break;
       }
       
      }
   }
 
 //  listFurniture.clear();

  // 2) On y rajoute les archétypes que l'on veut
  for(int i=0; i<sliderShelf - alreadyShelf; i++)        listFurniture.add(new Furniture(this, Archetype.SHELF));
  for(int i=0; i<sliderTable - alreadyTable; i++)        listFurniture.add(new Furniture(this, Archetype.TABLE));
  for(int i=0; i<sliderSofa  - alreadySofa; i++)         listFurniture.add(new Furniture(this, Archetype.SOFA));
  for(int i=0; i<sliderCoffeeTable - alreadyCoffeeTable; i++)  listFurniture.add(new Furniture(this, Archetype.COFFEE_TABLE));
  for(int i=0; i<sliderChair - alreadyChair; i++)        listFurniture.add(new Furniture(this, Archetype.CHAIR));

    //2) On test les regles vis à vis des autre objets dans l'espace
    int nbrTrial = 1000;
    int iTrial;
    boolean allGood;
    for(iTrial=1; iTrial <= nbrTrial; iTrial++) { //test de toutes les regles pour mon archétype
      allGood = true;
      
      // 3) On genere les nouvelles positions
      for(int i=0; i<listFurniture.size(); i++) {
        
        // PIVOT------------
        if(listFurniture.get(i).pivot && !listFurniture.get(i).pivotMob) { // cracra...
          continue;
        }
          
        if(listFurniture.get(i).pivotPos && listFurniture.get(i).type != Archetype.PIVOT_STD  && listFurniture.get(i).type != Archetype.NO_FUR) {
          println("PICVOT POS");
          listFurniture.get(i).newMob(this);
          continue;
        }
        
        //---------------------
          
        // a) hasard
        listFurniture.get(i).newPos();
        // b) colle au mure
        //listFurniture.get(i).newPosTouchWall();
        //listFurniture.get(i).newPosTest();
        // c) colle a un autre objet
        //if(i>0)
        //  listFurniture.get(i).newPosTouchFur(listFurniture.get(0));
      }
        
      // 4) On test les regles
      
      //"zero" rule : test if all is indeed inside the boundary of the room
      
      // "first" rule : having no collisions
      for(int i=0; i<listFurniture.size(); i++)
        for(int j=0; j<i; j++)
          if( isColliding(listFurniture.get(i), listFurniture.get(j)) )
            allGood = false;
            
      if(allGood)
        break;
    }
    
    if(iTrial == nbrTrial) {
      for(int i=0; i<listFurniture.size(); i++)
        listFurniture.get(i).position = new PVector(0,0,0);
      println("Tries as much as I could, but it didn't work :(");
    }
    
    checkAccordeon();
}

boolean isColliding(Furniture fur1, Furniture fur2) {
    
  PVector pos1, pos2, box1, box2;
  
    pos1 = fur1.position;
    if(fur1.rotId%2==0)  box1 = new PVector( fur1.box3D.z, fur1.box3D.x, fur1.box3D.y); // Don't ask and I won't tell...
    else                 box1 = new PVector( fur1.box3D.x, fur1.box3D.z, fur1.box3D.y);
    
    pos2 = fur2.position;
    if(fur2.rotId%2==0)  box2 = new PVector( fur2.box3D.z, fur2.box3D.x, fur2.box3D.y); // Don't ask and I won't tell...
    else                 box2 = new PVector( fur2.box3D.x, fur2.box3D.z, fur2.box3D.y);
  
    return !(pos1.x - box1.x/2 > pos2.x + box2.x/2 || pos1.x + box1.x/2 < pos2.x - box2.x/2
          || pos1.y - box1.y/2 > pos2.y + box2.y/2 || pos1.y + box1.y/2 < pos2.y - box2.y/2
          || pos1.z - box1.z/2 > pos2.z + box2.z/2 || pos1.z + box1.z/2 < pos2.z - box2.z/2 );
}

void checkAccordeon() { /// TODO

  //Destroy all the groups (later better just check for whom to erase/create)
  buttonCon.remove("accordionPiv"); 
  
  //Recreate them

  accordion = buttonCon.addAccordion("accordionPiv") // création accordion et placement des différents group inside
                 .setPosition(10,200)
                 .setWidth(200)
                 .setCollapseMode(Accordion.SINGLE);
    
    color myC;
   
   myGroups.clear();
    
  for(int i=0; i<listFurniture.size(); i++) {
    
    if( listFurniture.get(i).type == Archetype.PIVOT_STD )
      myC = color(160,50,80);
    else if( listFurniture.get(i).pivot)
      myC = color(80,160,50);
    else
      myC = color(50,80,160);
    
    
    controlP5.Group grp = buttonCon.addGroup("" + i + ": " + listFurniture.get(i).name)
                .setColorLabel(myC)
                .setBackgroundColor(color(230))
                .setBackgroundHeight(10)
                .setBarHeight(20)
                .setId(i);
                
    
    CheckBox boxFur = buttonCon.addCheckBox("checkBox"+i+1000)
                .setPosition(10, 20)
                .setColorActive(color(198, 18, 48))
                .setColorLabel(color(255))
                .setSize(20, 20)
                .setItemsPerRow(2)
                .setSpacingColumn(70)
                .setSpacingRow(10)
                .addItem(i + "Save Pos", 1)
                .setId(i+1000)
                .moveTo(grp);

// PUTAIN ... REVOIR LES CROSS NOMAGES...                
               
    CheckBox boxPos = buttonCon.addCheckBox("checkBox"+i+2000)
                .setPosition(10, 60)
                .setColorForeground(color(120))
                .setColorActive(color(198, 18, 48))
                .setColorLabel(color(255))
                .setSize(20, 20)
                .setItemsPerRow(2)
                .setSpacingColumn(70)
                .setSpacingRow(10)
                .addItem(i + "Save Furniture",1)
                .setId(i+2000)
                .moveTo(grp);


    if( listFurniture.get(i).pivotPos) {
      boxFur.activateAll();
      listFurniture.get(i).pivotPos = true;
    }
    if( listFurniture.get(i).pivotMob) {
      boxPos.activateAll();
      listFurniture.get(i).pivotMob = true;
    }


     //   boxFur.setValue(1);
        
    //if( listFurniture.get(i).type == Archetype.PIVOT_STD) { }
    accordion.addItem(grp);
    myGroups.add(grp);
  }
  
}

