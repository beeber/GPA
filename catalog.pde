
class catalog {
  
  XML dataBase;
  
  
  catalog(String _fileName) {
    dataBase = loadXML(_fileName);
    
  }
  
    
  XML getListArchetype(Archetype _arType) {
    
    XML[] listArchetype = dataBase.getChildren("archetype");
    
    for(int i=0; i<listArchetype.length; i++) {
      switch(_arType) {
       case CHAIR:         if(listArchetype[i].getString("type").equals("CHAIR") )        return listArchetype[i]; break;
       case TABLE:         if(listArchetype[i].getString("type").equals("TABLE") )        return listArchetype[i]; break;
       case COFFEE_TABLE:  if(listArchetype[i].getString("type").equals("COFFEE_TABLE"))  return listArchetype[i]; break;
       case SOFA:          if(listArchetype[i].getString("type").equals("SOFA"))          return listArchetype[i]; break;
       case SHELF:         if(listArchetype[i].getString("type").equals("SHELF"))         return listArchetype[i]; break;
       case PIVOT_STD:     if(listArchetype[i].getString("type").equals("PIVOT_STD"))     return listArchetype[i]; break;
     }
    }
    
    println("ISSUE in get list archetype");
    return listArchetype[0];
  }
  
  XML getFurXMLByID(int id) {
    
    XML[] listArchetype = dataBase.getChildren("archetype");
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

}
