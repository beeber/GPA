void cam(){
  cam = new PeasyCam(this, 0, 0, 0, 800); // valeur de base du point visé (x,y,z, distance)
  cam.setMinimumDistance(500); // distance minimal et maximal de la cam par rapport au model
  cam.setMaximumDistance(5000);
}

void disableCam(){
  hint(DISABLE_DEPTH_TEST);
  cam.beginHUD();
}

void enableCam(){
   cam.endHUD();
  hint(ENABLE_DEPTH_TEST);
}

