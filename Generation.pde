void seed(){
  
  // 1) On instancie notre tableau
   listFurniture = new ArrayList<Furniture>();

  // 2) On le surtout b
  for(int i=0; i<sliderChair; i++) {
    listFurniture.add(new Furniture(this));
  }
  // 3) On test des positions
  for(int i=0; i<100; println(i++)) // On essaie 10 fois de trouver des positions qui marchent
    if( testPosition() )
      return;
    
    println("Coin Coin.... pas de chocolat, mauvaises positions de chaises");
}

boolean testPosition() {
  
  // a) on donne de nouvelles positions
  for(int i=0; i<listFurniture.size(); i++)
     listFurniture.get(i).position = new PVector(random(-a/2,a/2),random(-a/2,a/2));
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

void parsingList(){  
  for(int i=0; i< listFurniture.size(); i++) {
    
      pushMatrix();
     
// MOVING

      translate(listFurniture.get(i).position.x, listFurniture.get(i).position.y, listFurniture.get(i).box3D.y/2);
      rotateZ(listFurniture.get(i).rotation);
      rotateX(-PI/2); // remettre droit

 
// MODEL
      noStroke();
      listFurniture.get(i).model.draw(); // dessiner model
     
// BOUNDING BOX

   //   listFurniture.get(i).drawCorners(); // dessiner sphere de bounding box

      /*
      stroke(150);
      noFill();
      chairs.get(i).bboxTemp.draw();
      */
      
      popMatrix();     
  }  
  
  }
