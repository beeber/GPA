import saito.objloader.*;

class Furniture {
  int id;
  PVector position;
  //float rotation;
  int rotId; // Only 4 possibilites
  OBJModel model;
  Archetype type;
  PVector box3D;
  
  boolean pivot;

  BoundingBox bboxTemp;
  
  int tSphere; // taille sphere bounding box

  
  Furniture(PApplet parent) {
   
    String fileName = ChairName.get(int(random(0,ChairName.size())));
    //String fileName = ChairName.get(0);
    position = new PVector(random(-xGeneral/2,yGeneral/2),random(-xGeneral/2,yGeneral/2));
    rotId = int(random(4));
  
  
    model = new OBJModel(parent, fileName, "relative", POLYGON);
    model.enableDebug();
    model.enableTexture();
    model.scale(100);
    model.translateToCenter();
    
    BoundingBox bbox = new BoundingBox(parent, model);
    bboxTemp = new BoundingBox(parent, model);
    //this.position.z = bbox.getWHD().z;
    box3D = bbox.getWHD(); // pour collision on va chercher le x,y
   
  }
   
   
   Furniture(PApplet parent, Archetype myType) {
   
    int fileID; 
    String fileName;

    ArrayList<Integer> myListFur = new ArrayList<Integer>();
    ArrayList<Integer> myListFurFinal = new ArrayList<Integer>();
    XML[] listFurXML = getListArchetype(myType).getChildren("furniture");
    
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
   id = listFurXML[fileID].getInt("id");
  
    model = new OBJModel(parent, "furniture/"+fileName, "relative", POLYGON);
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
    
    String fileName = getFurXMLByID( _id ).getChildren("filename")[0].getContent();
    
    model = new OBJModel(_parent, "furniture/"+fileName + ".obj", "relative", POLYGON);
    
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
  
  Furniture(PApplet parent, String fileName, PVector _pos, int _rotId){
    this.position = _pos;
    this.rotId = _rotId;
   
    model = new OBJModel(parent, "furniture/"+fileName + ".obj", "relative", POLYGON);
    //model.enableDebug();
    //model.enableTexture();
    model.scale(100);
    model.translateToCenter();
    
    BoundingBox bbox = new BoundingBox(parent, model);
    bboxTemp = new BoundingBox(parent, model);
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
  
  
  
  
  void drawCorners(){
    
    tSphere = 5;
    fill(255,0,0);
  
     
    pushMatrix();
    translate(bboxTemp.getMin().x, bboxTemp.getMin().y, bboxTemp.getMin().z);

    sphere(tSphere);
    popMatrix();
    
    pushMatrix();
    translate(bboxTemp.getMin().x, bboxTemp.getMin().y, bboxTemp.getMax().z);
    sphere(tSphere);
    popMatrix();
     
    pushMatrix();
    translate(bboxTemp.getMax().x, bboxTemp.getMax().y, bboxTemp.getMax().z);
    sphere(tSphere);
    popMatrix();
    
    pushMatrix();
    translate(bboxTemp.getMax().x, bboxTemp.getMax().y, bboxTemp.getMin().z);
    sphere(tSphere);
    popMatrix();
    
    pushMatrix();
    translate(bboxTemp.getMin().x, bboxTemp.getMax().y, bboxTemp.getMin().z);
    sphere(tSphere);
    popMatrix();

    pushMatrix();
    translate(bboxTemp.getMax().x, bboxTemp.getMin().y, bboxTemp.getMin().z);
    sphere(tSphere);
    popMatrix();
    
    pushMatrix();
    translate(bboxTemp.getMin().x, bboxTemp.getMax().y, bboxTemp.getMax().z);
    sphere(tSphere);
    popMatrix();

    pushMatrix();
    translate(bboxTemp.getMax().x, bboxTemp.getMin().y, bboxTemp.getMax().z);
    sphere(tSphere);
    popMatrix();
    
  }
  
 
} // fin class



/*
bbox.getWHD.x
this.position.x. boundingBox/2
this.position.y. boundingBox/2
this.position.y. bounding*/
