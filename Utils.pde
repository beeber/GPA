

void saveScene(String fileName) {
  
  XML scene = parseXML("<?xml version=\"1.0\" encoding=\"UTF-8\"?> <scene> </scene>");
  XML fur;
  
  for(int i=0; i<listFurniture.size(); i++) {
    fur = parseXML("<furniture id=\"" + listFurniture.get(i).id + "\" rot=\""+ listFurniture.get(i).rotId + "\" pivot=\""+ listFurniture.get(i).pivot + "\"> <pos x=\"" +
                   listFurniture.get(i).position.x+"\" y=\""+listFurniture.get(i).position.y+"\" z=\""+listFurniture.get(i).position.z+"\"/> </furniture>");
    scene.addChild(fur);
  }
  
  saveXML(scene, fileName);
  
}


void loadScene(String fileName) {

  listFurniture.clear();
  
  XML scene = loadXML(fileName);
  XML[] listFur = scene.getChildren("furniture");
  Furniture fur;
  int id;
  
  for(int i=0; i<listFur.length; i++) {
    
    fur = new Furniture(this, listFur[i].getInt("id"));
    println("INNNNN");
    fur.position = new PVector(listFur[i].getChildren("pos")[0].getFloat("x"), listFur[i].getChildren("pos")[0].getFloat("y"), listFur[i].getChildren("pos")[0].getFloat("z"));
    fur.rotId = listFur[i].getInt("rot");
    
    if(listFur[i].getString("pivot").equals("true")) { // Pas possible de lire une boolean d'un XML ?
      fur.pivot = true;
    } else {
      fur.pivot = false;
    }
    
    listFurniture.add(fur);
  }
 
}







 
 void boxPivot(){   // BOX POUR PIVOT 
//Porte fenetre
      pushMatrix();
        translate(-215,-150,110);
          if(buttonCon.isMouseOver(buttonCon.getController("pivSlidingWindow"))) {
        fill(hoverColor);
      } else {
        noStroke();
        noFill();
      }
        box(20,160,220);
      popMatrix();
// porte
      pushMatrix();
        translate(215,157,105);
          if(buttonCon.isMouseOver(buttonCon.getController("pivDoor"))) {
        fill(hoverColor);
      } else {
        noStroke();
        noFill();
      }
        box(20,85,210);
      popMatrix(); 
// fenetre 
      pushMatrix();
        translate(-10,290,150);
          if(buttonCon.isMouseOver(buttonCon.getController("pivWindow"))) {
        fill(hoverColor);
      } else {
        noStroke();
        noFill();
      }
        box(135,20,120);
      popMatrix(); 
// bloc
     pushMatrix();
        translate(198,75,134);
          if(buttonCon.isMouseOver(buttonCon.getController("pivMass"))) {
        fill(hoverColor);
      } else {
        noStroke();
        noFill();
      }
        box(12,42,60);
      popMatrix();  
// Radiateur
     pushMatrix();
        translate(140,265,50);
          if(buttonCon.isMouseOver(buttonCon.getController("pivRadiator"))) {
        fill(hoverColor);
      } else {
        noStroke();
        noFill();
      }
        box(125,30,100);
      popMatrix(); 
      
 }

