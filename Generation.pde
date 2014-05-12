void seed(){
   chairs = new ArrayList<Chair>(); // crée ou vide un tableau

  //On charge et "add" des models
  for(int i=0; i<sliderChair; i++) { 
    println(ChairName);
    Chair newChair = new Chair(this,ChairName.get(int(random(0,4))) /* random sur le noms des .obj */,new PVector(random(-a/2,a/2),random(-a/2,a/2)),rotOr[int(random(4))]);
     
     
     for(int j = 0; j < chairs.size(); j++){
       Chair oldChair = chairs.get(j);
       if(isColliding(newChair, oldChair)){
         chairs = new ArrayList<Chair>(); // on vide le tableau
         seed();
         return; // on arrete le processus si jamais y a une collision
       }
     }
     chairs.add(newChair);
    
  }
}


void parsingList(){  
  for(int i=0; i< chairs.size(); i++) {
    
      pushMatrix();
     
// MOVING

      translate(chairs.get(i).position.x, chairs.get(i).position.y, chairs.get(i).box3D.y/2);
      rotateZ(chairs.get(i).rotation);
      rotateX(-PI/2); // remettre droit

 
// MODEL
      noStroke();
      chairs.get(i).model.draw(); // dessiner model
      chairs.get(i).drawCorners(); // dessiner sphere de bounding box
     
// BOUNDING BOX
      /*
      stroke(150);
      noFill();
      chairs.get(i).bboxTemp.draw();
      */
      
      popMatrix();     
  }  
  
  }
