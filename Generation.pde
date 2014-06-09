void seed(){
  
  // 1) On instancie notre tableau
   listFurniture.clear();

  // 2) On y rajoute les archétypes que l'on veut
  for(int i=0; i<sliderSofa; i++)         listFurniture.add(new Furniture(this, Archetype.SOFA));
  for(int i=0; i<sliderShelf; i++)        listFurniture.add(new Furniture(this, Archetype.SHELF));
  for(int i=0; i<sliderTable; i++)        listFurniture.add(new Furniture(this, Archetype.TABLE));
  for(int i=0; i<sliderCoffeeTable; i++)  listFurniture.add(new Furniture(this, Archetype.COFFEE_TABLE));
  for(int i=0; i<sliderChair; i++)        listFurniture.add(new Furniture(this, Archetype.CHAIR));

    //2) On test les regles vis à vis des autre objets dans l'espace
    int nbrTrial = 1000;
    int iTrial;
    boolean allGood;
    for(iTrial=1; iTrial <= nbrTrial; iTrial++) { //test de toutes les regles pour mon archétype
      allGood = true;
      
      // 3) On genere les nouvelles positions
      for(int i=0; i<listFurniture.size(); i++) {
      
        // a) hasard
        listFurniture.get(i).newPos();
        // b) colle au mure
        //listFurniture.get(i).newPosTouchWall();
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


