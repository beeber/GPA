
void saveScene(String fileName) {
  
  XML scene = parseXML("<?xml version=\"1.0\" encoding=\"UTF-8\"?> <scene> </scene>");
  XML fur;
  
  for(int i=0; i<listFurniture.size(); i++) {
    fur = parseXML("<furniture id=\"" + listFurniture.get(i).id + "\" rot=\""+ listFurniture.get(i).rotId + "\" pivot=\"false\"> <pos x=\"" +
                   listFurniture.get(i).position.x+"\" y=\""+listFurniture.get(i).position.y+"\" z=\""+listFurniture.get(i).position.z+"\"/> </furniture>");
    scene.addChild(fur);
  }
  
  for(int i=0; i<listPivot.size(); i++) {
    fur = parseXML("<furniture id=\"" + listFurniture.get(i).id + "\" rot=\""+ listFurniture.get(i).rotId + "\" pivot=\"true\"> <pos x=\"" +
                   listFurniture.get(i).position.x+"\" y=\""+listFurniture.get(i).position.y+"\" z=\""+listFurniture.get(i).position.z+"\"/> </furniture>");
    scene.addChild(fur);
  }
  
  saveXML(scene, fileName);
  
}


void loadScene(String fileName) {
  listFurniture.clear();
  listPivot.clear();
  
  
  XML scene = loadXML(fileName);
  XML[] listFur = scene.getChildren("furniture");
  Furniture fur;
  int id;
  
  for(int i=0; i<listFur.length; i++) {
    
    fur = new Furniture(this, listFur[i].getInt("id"));
    println("INNNNN");
    fur.position = new PVector(listFur[i].getChildren("pos")[0].getFloat("x"), listFur[i].getChildren("pos")[0].getFloat("y"), listFur[i].getChildren("pos")[0].getFloat("z"));
    fur.rotId = listFur[i].getInt("rot");
    
    
    if(listFur[i].getString("pivot").equals("true")) {
      listPivot.add(fur);
    } else {
      listFurniture.add(fur);
    }
  }
  

}

