
boolean isColliding(Furniture chair1, Furniture chair2){
      
    return !(chair1.position.x + chair1.bboxTemp.getMin().x > chair2.position.x + chair2.bboxTemp.getMax().x 
          || chair1.position.x + chair1.bboxTemp.getMax().x < chair2.position.x + chair2.bboxTemp.getMin().x
  
          || chair1.position.y + chair1.bboxTemp.getMin().y > chair2.position.y + chair2.bboxTemp.getMax().y
          || chair1.position.y + chair1.bboxTemp.getMax().y < chair2.position.y + chair2.bboxTemp.getMin().y
    
          || chair1.position.z + chair1.bboxTemp.getMin().z > chair2.position.z + chair2.bboxTemp.getMax().z 
          || chair1.position.z + chair1.bboxTemp.getMax().z < chair2.position.z + chair2.bboxTemp.getMin().z);
}

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

