import saito.objloader.*;

class Furniture {
  PVector position;
  float rotation;
  OBJModel model;
  Archetype type;
  PVector box3D;

  BoundingBox bboxTemp;
  
  int tSphere; // taille sphere bounding box

  
  Furniture(PApplet parent) {
   
    String fileName = ChairName.get(int(random(0,ChairName.size())));
    //String fileName = ChairName.get(0);
    position = new PVector(random(-a/2,a/2),random(-a/2,a/2));
    rotation = rotOr[int(random(4))];
  
  
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
   
   String fileName;
    switch(myType) {
      case CHAIR: fileName        = ChairName.get(       int(random(0,ChairName.size()))); break;
      case TABLE: fileName        = TableName.get(       int(random(0,TableName.size()))); break;
      case SOFA:  fileName        = SofaName.get(        int(random(0,SofaName.size()))); break;
      case SHELF: fileName        = ShelfName.get(       int(random(0,ShelfName.size()))); break;
      case COFFEE_TABLE: fileName = CoffeeTableName.get( int(random(0,CoffeeTableName.size()))); break;
      
      default: fileName = ChairName.get(int(random(0,4))); break;
    }   
   
    //String fileName = ChairName.get(0);
    position = new PVector(random(-a/2,a/2),random(-a/2,a/2));
    rotation = rotOr[int(random(4))];
  
  
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
  
  
  Furniture(PApplet parent, String fileName, PVector position, float rotation){
    this.position = position;
    this.rotation = rotation;
   
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
