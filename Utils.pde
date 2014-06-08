
//Put all the catalog stuff in a class, called catalog

XML getListArchetype(Archetype _arType) {
  
  XML[] listArchetype = catalog.getChildren("archetype");
  
  for(int i=0; i<listArchetype.length; i++) {
    switch(_arType) {
     case CHAIR:         if(listArchetype[i].getString("type").equals("CHAIR") )        return listArchetype[i]; break;
     case TABLE:         if(listArchetype[i].getString("type").equals("TABLE") )        return listArchetype[i]; break;
     case COFFEE_TABLE:  if(listArchetype[i].getString("type").equals("COFFEE_TABLE"))  return listArchetype[i]; break;
     case SOFA:          if(listArchetype[i].getString("type").equals("SOFA"))          return listArchetype[i]; break;
     case SHELF:         if(listArchetype[i].getString("type").equals("SHELF"))         return listArchetype[i]; break;
    }
  }
  
  println("ISSUE in get list archetype");
  return listArchetype[0];
}

XML getFurXMLByID(int id) {
  
  XML[] listArchetype = catalog.getChildren("archetype");
  XML[] listFur;
  
  for(int i=0; i<listArchetype.length; i++) {
    listFur = listArchetype[i].getChildren("furniture");
      for(int j=0; j<listFur.length; j++) {
        if(listFur[j].getInt("id") == id)
          return listFur[j];
      }
  }
  
  println("ISSUE In get furniture by ID");
  return parseXML("");
  
}

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

