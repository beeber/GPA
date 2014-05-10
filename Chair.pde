import saito.objloader.*;

class Chair{
  PVector position;
  float rotation;
  OBJModel model;
  String type;
  PVector box3D;

  BoundingBox bboxTemp;

  
  //méthode constructeur
  Chair(PApplet parent, String fileName, PVector position, float rotation){
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
 
} // fin class
