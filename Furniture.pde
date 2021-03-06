import saito.objloader.*;

class Furniture {
  int id;
  PVector position;
  //float rotation;
  int rotId; // Only 4 possibilites
  OBJModel model;
  Archetype type;
  PVector box3D;
  String name;
  
  boolean pivot;
  boolean pivotPos;
  boolean pivotMob;
  
  int marginFront, marginBack, marginLeft, marginRight;
  int margin;
  
  BoundingBox bboxTemp;
  
  int tSphere; // taille sphere bounding box


//IMPORTANT!!!
// USING newMob & newPos in constructors


  Furniture(PApplet parent) {
    id = -1;
    name = "NO_NAME";
    type = Archetype.PIVOT_STD;
    
    pivotPos = pivotMob = false;
    marginFront = 0; marginBack = 0; marginLeft = 0; marginRight = 0;
    margin = 0;
  }
   
   
   Furniture(PApplet parent, Archetype myType) {
     
    pivotPos = pivotMob = false;
    marginFront = 0; marginBack = 0; marginLeft = 0; marginRight = 0;
    margin = 0;
    int fileID; 
    String fileName;
    
    pivotPos = pivotMob = false;

    ArrayList<Integer> myListFur = new ArrayList<Integer>();
    ArrayList<Integer> myListFurFinal = new ArrayList<Integer>();
    XML[] listFurXML = myCat.getListArchetype(myType).getChildren("furniture");
    
    for(int i=0; i<listFurXML.length; i++)
      myListFur.add(i);
      
   if(buttonCon.get(Textfield.class,"tags").getText().equals("")) {
     fileID = myListFur.get( int(random(0,myListFur.size())));
   }else {
     
    String[] myTags = split(buttonCon.get(Textfield.class,"tags").getText(), ' ');  
    for(int i=0; i< myListFur.size(); i++) {
      
      //Load tags
      String[] furTags = split( listFurXML[i].getChildren("tag")[0].getContent(), ' ');  
      
      //Check tags
      boolean ok = false;
      for(int j=0; j< furTags.length; j++)
      for(int k=0; k< myTags.length; k++)
        if(furTags[j].equals(myTags[k]))
           ok = true;
      if(ok)
        myListFurFinal.add( myListFur.get(i) );
    }
    
    fileID = myListFurFinal.get( int(random(0,myListFurFinal.size())));
   }
   
   
   fileName = listFurXML[fileID].getChildren("filename")[0].getContent()  + ".obj";
   name = listFurXML[fileID].getChildren("name")[0].getContent();
   type = myType;
   id = listFurXML[fileID].getInt("id");
  

    model = new OBJModel(parent, "data/"+fileName, "relative", POLYGON);
    model.enableDebug();
    model.enableTexture();
    model.scale(100);
    model.translateToCenter();
    
    BoundingBox bbox = new BoundingBox(parent, model);
    bboxTemp = new BoundingBox(parent, model);
    //this.position.z = bbox.getWHD().z;
    box3D = bbox.getWHD(); // pour collision on va chercher le x,y
    
    rotId = int(random(4));
    if(rotId%2==0)
      position = new PVector(random(-xGeneral/2 + box3D.z/2, xGeneral/2 - box3D.z/2), 
                             random(-yGeneral/2 + box3D.x/2, yGeneral/2 - box3D.x/2));
    else
      position = new PVector(random(-xGeneral/2 + box3D.x/2, xGeneral/2 - box3D.x/2), 
                             random(-yGeneral/2 + box3D.z/2, yGeneral/2 - box3D.z/2));
  
 

  }
  
  
  Furniture(PApplet _parent, int _id){
  margin = 0;
    pivotPos = pivotMob = false;
    marginFront = 0; marginBack = 0; marginLeft = 0; marginRight = 0;
    String fileName = myCat.getFurXMLByID( _id ).getChildren("filename")[0].getContent();
    name = myCat.getFurXMLByID( _id ).getChildren("name")[0].getContent();
    
    String typStr = myCat.getFurXMLByID( _id ).getParent().getString("type");
    
    if(typStr.equals("TABLE")) type = Archetype.TABLE;
    else if(typStr.equals("COFFEE_TABLE")) type = Archetype.COFFEE_TABLE;
    else if(typStr.equals("SHELF")) type = Archetype.SOFA;
    else if(typStr.equals("CHAIR")) type = Archetype.TABLE;
    else if(typStr.equals("PIVOT_STD")) type = Archetype.TABLE;
    else { println("ISSUE IN LOADINF FURNITURE IN CATALOG: NO TYPE"); type = Archetype.NO_FUR; }
    
    
    model = new OBJModel(_parent, fileName + ".obj", "relative", POLYGON);
    
    this.position = new PVector();
    this.rotId = 0;
   
    //model.enableDebug();
    //model.enableTexture();
    model.scale(100);
    model.translateToCenter();
    
    BoundingBox bbox = new BoundingBox(_parent, model);
    bboxTemp = new BoundingBox(_parent, model);
    //this.position.z = bbox.getWHD().z;
    box3D = bbox.getWHD(); // pour collision on va chercher le x,y
   
  }
 /* 
  Furniture(PApplet parent, String fileName, PVector _pos, int _rotId){
    this.position = _pos;
    this.rotId = _rotId;
   
    model = new OBJModel(parent, fileName + ".obj", "relative", POLYGON);
    println("BAD LOADING, SHOULD USE DATABASE");
    name = fileName;
    //model.enableDebug();
    //model.enableTexture();
    model.scale(100);
    model.translateToCenter();
    
    BoundingBox bbox = new BoundingBox(parent, model);
    bboxTemp = new BoundingBox(parent, model);
    //this.position.z = bbox.getWHD().z;
    box3D = bbox.getWHD(); // pour collision on va chercher le x,y
   
  }
  */
  PVector getRbox() {
    if(rotId%2==0)
      return new PVector(box3D.z, box3D.x, box3D.y);
    else
      return new PVector(box3D.x, box3D.z, box3D.y);
  }
  
  void newMob(PApplet _parent) {
        
    int fileID; 
    String fileName;

    ArrayList<Integer> myListFur = new ArrayList<Integer>();
    ArrayList<Integer> myListFurFinal = new ArrayList<Integer>();
    XML[] listFurXML = myCat.getListArchetype(type).getChildren("furniture");
    
    for(int i=0; i<listFurXML.length; i++)
      myListFur.add(i);
      
    if(buttonCon.get(Textfield.class,"tags").getText().equals("")) {
      fileID = myListFur.get( int(random(0,myListFur.size())));
    } else {
     
    String[] myTags = split(buttonCon.get(Textfield.class,"tags").getText(), ' ');  
    for(int i=0; i< myListFur.size(); i++) {
      //Load tags
      String[] furTags = split( listFurXML[i].getChildren("tag")[0].getContent(), ' ');  
      
      //Check tags
      boolean ok = false;
      for(int j=0; j< furTags.length; j++)
      for(int k=0; k< myTags.length; k++)
        if(furTags[j].equals(myTags[k]))
           ok = true;
      if(ok)
        myListFurFinal.add( myListFur.get(i) );
    }
    
    fileID = myListFurFinal.get( int(random(0,myListFurFinal.size())));
   }
   
   
   fileName = listFurXML[fileID].getChildren("filename")[0].getContent()  + ".obj";
   name = listFurXML[fileID].getChildren("name")[0].getContent();
   id = listFurXML[fileID].getInt("id");
  

    model = new OBJModel(_parent, "data/"+fileName, "relative", POLYGON);
    model.enableDebug();
    model.enableTexture();
    model.scale(100);
    model.translateToCenter();
    
    BoundingBox bbox = new BoundingBox(_parent, model);
    bboxTemp = new BoundingBox(_parent, model);
    //this.position.z = bbox.getWHD().z;
    box3D = bbox.getWHD(); // pour collision on va chercher le x,y

  }
  
  void newPos() {
   
    rotId = int(random(4));
    if(rotId%2==0)
      position = new PVector(random(-xGeneral/2 + box3D.z/2, xGeneral/2 - box3D.z/2), 
                             random(-yGeneral/2 + box3D.x/2, yGeneral/2 - box3D.x/2));
    else
      position = new PVector(random(-xGeneral/2 + box3D.x/2, xGeneral/2 - box3D.x/2), 
                             random(-yGeneral/2 + box3D.z/2, yGeneral/2 - box3D.z/2));
                             
  }
  
    
  void newPosTouchFur(Furniture _fur) {
   
    rotId = int(random(4));
    switch(rotId) {
     case 0:
      if(getRbox().x < _fur.getRbox().x) // Check if furniture to place is "smaller"
        position = new PVector( _fur.position.x + _fur.getRbox().x/2 + getRbox().x/2 , random( _fur.position.y - _fur.getRbox().y/2 + getRbox().y/2, _fur.position.y + _fur.getRbox().y/2 - getRbox().y/2) );
      else
        position = new PVector( _fur.position.x + _fur.getRbox().x/2 + getRbox().x/2 , _fur.position.y);
      break; 
     case 1:
      if(getRbox().y < _fur.getRbox().y) // Check if furniture to place is "smaller"
        position = new PVector( random( _fur.position.x - _fur.getRbox().x/2 + getRbox().x/2, _fur.position.x + _fur.getRbox().x/2 - getRbox().x/2), _fur.position.y  + _fur.getRbox().y/2 + getRbox().y/2 );
      else
        position = new PVector( _fur.position.x , _fur.position.y  + _fur.getRbox().y/2 + getRbox().y/2);
      break; 
     case 2:
      if(getRbox().x < _fur.getRbox().x) // Check if furniture to place is "smaller"
        position = new PVector( _fur.position.x - _fur.getRbox().x/2 - getRbox().x/2 , random( _fur.position.y - _fur.getRbox().y/2 + getRbox().y/2, _fur.position.y + _fur.getRbox().y/2 - getRbox().y/2) );
      else
        position = new PVector( _fur.position.x - _fur.getRbox().x/2 - getRbox().x/2 , _fur.position.y);
      break; 
     case 3:
      if(getRbox().y < _fur.getRbox().y) // Check if furniture to place is "smaller"
        position = new PVector( random( _fur.position.x - _fur.getRbox().x/2 + getRbox().x/2, _fur.position.x + _fur.getRbox().x/2 - getRbox().x/2), _fur.position.y  - _fur.getRbox().y/2 - getRbox().y/2 );
      else
        position = new PVector( _fur.position.x , _fur.position.y  - _fur.getRbox().y/2 - getRbox().y/2);
      break;   
    }
    
  }
  
  void newPosTouchWall() {
    rotId = int(random(4));
    switch(rotId) {
     case 0:
      position = new PVector(xGeneral/2 - box3D.z/2, 
                             random(-yGeneral/2 + box3D.x/2, yGeneral/2 - box3D.x/2));
      break; 
     case 1:
      position = new PVector(random(-xGeneral/2 + box3D.x/2, xGeneral/2 - box3D.x/2), 
                             yGeneral/2 - box3D.z/2);
      break; 
     case 2:
      position = new PVector(-xGeneral/2 + box3D.z/2, 
                             random(-yGeneral/2 + box3D.x/2, yGeneral/2 - box3D.x/2));
      break; 
     case 3:
      position = new PVector(random(-xGeneral/2 + box3D.x/2, xGeneral/2 - box3D.x/2), 
                             -yGeneral/2 + box3D.z/2);
      break;   
    }
   
  }
 /* 
  void newPosTest() {
     if(Furniture.type == Archetype.SHELF){
        rotId = int(random(4));
        switch(rotId) {
           case 0:
            position = new PVector(xGeneral/2 - box3D.z/2, 
                                   random(-yGeneral/2 + box3D.x/2, yGeneral/2 - box3D.x/2));
            break; 
           case 1:
            position = new PVector(random(-xGeneral/2 + box3D.x/2, xGeneral/2 - box3D.x/2), 
                                   yGeneral/2 - box3D.z/2);
            break; 
           case 2:
            position = new PVector(-xGeneral/2 + box3D.z/2, 
                                   random(-yGeneral/2 + box3D.x/2, yGeneral/2 - box3D.x/2));
            break; 
           case 3:
            position = new PVector(random(-xGeneral/2 + box3D.x/2, xGeneral/2 - box3D.x/2), 
                                   -yGeneral/2 + box3D.z/2);
            break;  
          }
      }
  }
    
    

  /*
  void ruleShelf()  { // pos = 90% stuck at wall
  
    if(listFurniture.get(i).archetype == PIVOT_STD)
    
    
   for(Archetype.SHELF = 1){
      int i = random(0, 100);
      if(i>0 && i<90){
          rotId = int(random(4));
          switch(rotId) {
           case 0:
            Archetype.SHELF.position = new PVector(xGeneral/2 - box3D.z/2, 
                                   random(-yGeneral/2 + box3D.x/2, yGeneral/2 - box3D.x/2));
            break; 
           case 1:
            Archetype.SHELF.position = new PVector(random(-xGeneral/2 + box3D.x/2, xGeneral/2 - box3D.x/2), 
                                   yGeneral/2 - box3D.z/2);
            break; 
           case 2:
            Archetype.SHELF.position = new PVector(-xGeneral/2 + box3D.z/2, 
                                   random(-yGeneral/2 + box3D.x/2, yGeneral/2 - box3D.x/2));
            break; 
           case 3:
            Archetype.SHELF.positionn = new PVector(random(-xGeneral/2 + box3D.x/2, xGeneral/2 - box3D.x/2), 
                                   -yGeneral/2 + box3D.z/2);
            break;   
         }
      }
    }
  }
  */
  
  
  
  void drawCorners(){
    
    marginFront = 100; marginBack = 0; marginLeft = 25; marginRight = 50;
    
    tSphere = 5;
    fill(255,0,0);
    int mL=0, mR=0, mF=0, mB=0;
    
    println(rotId);
    
    switch(rotId) {
     case 0: mB = marginLeft; mR = marginFront; mF = marginRight; mL = marginBack; break;
     case 1: mR = marginLeft; mF = marginRight; mL = marginFront; mB = marginBack; break;
     case 2: mF = marginLeft; mL = marginFront; mB = marginRight; mR = marginBack; break;
     case 3: mL = marginLeft; mB = marginRight; mR = marginFront; mF = marginBack; break;
    }
   
    
     pushMatrix();
       translate(bboxTemp.getMin().x - mL,0,0); box(10);
     popMatrix();
     pushMatrix();
       translate(bboxTemp.getMax().x + mR,0,0); box(10);
     popMatrix();
     pushMatrix();
       translate(0,0,bboxTemp.getMin().z - mB); box(10);
     popMatrix();
     pushMatrix();
       translate(0,0,bboxTemp.getMax().z + mF); box(10);
     popMatrix();
  
     /*
      pushMatrix();
      translate(bboxTemp.getMin().x, bboxTemp.getMax().y, bboxTemp.getMin().z);
      sphere(tSphere);
      popMatrix();
      
      pushMatrix();
      translate(bboxTemp.getMin().x, bboxTemp.getMax().y, bboxTemp.getMax().z);
      sphere(tSphere);
      popMatrix();
       
      pushMatrix();
      translate(bboxTemp.getMax().x, bboxTemp.getMax().y, bboxTemp.getMin().z);
      sphere(tSphere);
      popMatrix();
      
      pushMatrix();
      translate(bboxTemp.getMax().x, bboxTemp.getMax().y, bboxTemp.getMax().z);
      sphere(tSphere);
      popMatrix();

    
    
    //----
    
    pushMatrix();
    translate(bboxTemp.getMin().x, bboxTemp.getMin().y, bboxTemp.getMax().z);
    sphere(tSphere);
    popMatrix();
    
    pushMatrix();
    translate(bboxTemp.getMax().x, bboxTemp.getMin().y, bboxTemp.getMax().z);
    sphere(tSphere);
    popMatrix();
    
    pushMatrix();
    translate(bboxTemp.getMax().x, bboxTemp.getMin().y, bboxTemp.getMin().z);
    sphere(tSphere);
    popMatrix();
    
    pushMatrix();
    translate(bboxTemp.getMin().x, bboxTemp.getMin().y, bboxTemp.getMin().z);
    sphere(tSphere);
    popMatrix();
*/
  }
  
 
} // fin class



/*
bbox.getWHD.x
this.position.x. boundingBox/2
this.position.y. boundingBox/2
this.position.y. bounding*/
