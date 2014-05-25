void rotOr(){
  rotOr[0]= PI/2;
  rotOr[1]= PI;
  rotOr[2]= 3*PI/2;
  rotOr[3]= 2*PI;

}


boolean isColliding(Chair chair1, Chair chair2){
      
    return !(chair1.position.x + chair1.bboxTemp.getMin().x > chair2.position.x + chair2.bboxTemp.getMax().x 
          || chair1.position.x + chair1.bboxTemp.getMax().x < chair2.position.x + chair2.bboxTemp.getMin().x
  
          || chair1.position.y + chair1.bboxTemp.getMin().y > chair2.position.y + chair2.bboxTemp.getMax().y
          || chair1.position.y + chair1.bboxTemp.getMax().y < chair2.position.y + chair2.bboxTemp.getMin().y
    
          || chair1.position.z + chair1.bboxTemp.getMin().z > chair2.position.z + chair2.bboxTemp.getMax().z 
          || chair1.position.z + chair1.bboxTemp.getMax().z < chair2.position.z + chair2.bboxTemp.getMin().z);
}

