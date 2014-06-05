import saito.objloader.*;

class Furniture {
  PVector position;
  float rotation;
  OBJModel model;
  Archetype type;
  PVector box3D;
  
  boolean pivot;

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
   /* switch(myType) {
      case CHAIR: fileName        = ChairName.get(       int(random(0,ChairName.size())))  + ".obj"; break;
      case TABLE: fileName        = TableName.get(       int(random(0,TableName.size()))) + ".obj"; break;
      case SOFA:  fileName        = SofaName.get(        int(random(0,SofaName.size()))) + ".obj"; break;
      case SHELF: fileName        = ShelfName.get(       int(random(0,ShelfName.size()))) + ".obj"; break;
      case COFFEE_TABLE: fileName = CoffeeTableName.get( int(random(0,CoffeeTableName.size()))) + ".obj"; break;
      
      default: fileName = ChairName.get(int(random(0,4))) + ".obj"; break;
    }   
   */
   
    ArrayList<String> myListFur;
    switch(myType) {
      case CHAIR:        myListFur = new ArrayList<String>(ChairName); break;
      case TABLE:        myListFur = new ArrayList<String>(TableName); break;
      case SOFA:         myListFur = new ArrayList<String>(SofaName); break;
      case SHELF:        myListFur = new ArrayList<String>(ShelfName); break;
      case COFFEE_TABLE: myListFur = new ArrayList<String>(CoffeeTableName); break;
      
      default: myListFur = new ArrayList<String>(ChairName); break;
    } 
   
   if(buttonCon.get(Textfield.class,"tags").getText().equals("")) {
     
    fileName = myListFur.get( int(random(0,myListFur.size())))  + ".obj";
     
   }else {
     
    String[] listTags = split(buttonCon.get(Textfield.class,"tags").getText(), ' ');  
    println("tags: " + listTags);
    
    ArrayList<String> myListFurFinal = new ArrayList<String>();
   
    for(int i=0; i< myListFur.size(); i++) {
      String lines[] = loadStrings("furniture/" + myListFur.get(i) + ".txt");
      println(lines);
      boolean ok = false;
      
      for(int j=0; j< lines.length; j++)
      for(int k=0; k< listTags.length; k++)
        if(lines[j].equals(listTags[k]))
           ok = true;
      if(ok)
        myListFurFinal.add( myListFur.get(i) );
    }
    
    fileName = myListFurFinal.get( int(random(0,myListFurFinal.size())))  + ".obj";
   }
   
   
   
   
    //String fileName = ChairName.get(0);
    position = new PVector(random(-a/2,a/2),random(-a/2,a/2));
    rotation = rotOr[int(random(4))];
  
  
    model = new OBJModel(parent, "furniture/"+fileName, "relative", POLYGON);
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
   
    model = new OBJModel(parent, "furniture/"+fileName + ".obj", "relative", POLYGON);
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
