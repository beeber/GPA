void seed(){
  
  // 1) On instancie notre tableau
   listFurniture = new ArrayList<Furniture>();

  // 2.OLD) On y rajoute les archétypes que l'on veut
  //---OLD--
  for(int i=0; i<sliderChair; i++) 
    listFurniture.add(new Furniture(this, Archetype.CHAIR));
  for(int i=0; i<sliderSofa; i++) 
    listFurniture.add(new Furniture(this, Archetype.SOFA));
  for(int i=0; i<sliderShelf; i++) 
    listFurniture.add(new Furniture(this, Archetype.SHELF));
  for(int i=0; i<sliderTable; i++) 
    listFurniture.add(new Furniture(this, Archetype.TABLE));
  for(int i=0; i<sliderCoffeeTable; i++) 
    listFurniture.add(new Furniture(this, Archetype.COFFEE_TABLE));
    //---Old/--
             
      
      /*
      
    //2) On rajoute un objet
      // Dans quel ordre ? Quel objet ?
      
      //2) On test les regles vis à vis des autre objets dans l'espace
    int nbrTrial = 1000;
    for(int i=0; i< nbrTrial; i++) {
     //test de toutes les regles pour mon archétype
     

  //TODO? creer une fonction qui appelera les regles
        //dans la fonction : boucle qui test mon archétype VS tout les autres archétype environnant, et les points pivot.

     //Si regle n'est pas validé, on relance
     
     //Si on a relancé trop de fois, on exit
      if (i == nbrTrial -1)
        println("Pas possible ... :(");
    }
    
    */
    
    
    
/*
  // 3) On test des positions
  for(int i=0; i<100; println(i++)) // On essaie 10 fois de trouver des positions qui marchent
    if( testPosition() )
      return;
    
    println("Coin Coin.... pas de chocolat, mauvaises positions de chaises");
*/
}

boolean testPosition() {
  
  // a) on donne de nouvelles positions
  for(int i=0; i<listFurniture.size(); i++)
 //    listFurniture.get(i).position = new PVector(random(-xGeneral/2,yGeneral/2),random(-xGeneral/2,yGeneral/2));
     /*
     if(chairs.size() >1) {
    chairs.get(0).position = new PVector(0,0);
    chairs.get(1).position = new PVector(150,140);
     }
     */
    println("start");
  for(int i=0; i<listFurniture.size(); i++)
    for(int j=i+1; j<listFurniture.size(); j++) {
/*Chair chair1 = chairs.get(i);
        Chair chair2 = chairs.get(j);
        if(chair1.position.x + chair1.bboxTemp.getMin().x > chair2.position.x + chair2.bboxTemp.getMax().x) println ("1");
        if(chair1.position.x + chair1.bboxTemp.getMax().x < chair2.position.x + chair2.bboxTemp.getMin().x) println ("2");
  
        if(chair1.position.y + chair1.bboxTemp.getMin().y > chair2.position.y + chair2.bboxTemp.getMax().y) println ("3");
        if(chair1.position.y + chair1.bboxTemp.getMax().y < chair2.position.y + chair2.bboxTemp.getMin().y) println ("4");
    
        if(chair1.position.z + chair1.bboxTemp.getMin().z > chair2.position.z + chair2.bboxTemp.getMax().z) println ("5");
        if(chair1.position.z + chair1.bboxTemp.getMax().z < chair2.position.z + chair2.bboxTemp.getMin().z) println ("6");
    }
  */  
    
     if(isColliding(listFurniture.get(i), listFurniture.get(i))) {
       println("collide mother fucker");
        return false;
     }
  }
  return true;
      
}

