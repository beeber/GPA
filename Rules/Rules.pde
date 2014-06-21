
// faire un mode débug ou on voit visuellement par des lignes de couleur les relations entre les objets ?

// ************************FONCTION*************************************************

void NO_OBJ() = collision "secondaire" sur zone spécifique 
void LIGHT_CONE() = Probabilité de placement de 100% en son épicentre, diminuant jusqua 0%
void HEAT_CONE() = Probabilité de placement de 100% en son épicentre, diminuant jusqua 0%
      
// ************************POINT SPECIFIQUE*****************************************    


SHELF :
    █ 100% faces avant orientées vers le centre de la pièce
    █ 100% crée zone interdite de +(0,40cm) face avant
    
    █ 90% les étagères soient collé au mur
      else position au millieu de la pièce avec décallage (-100,+100cm), un des coté de létagère collé au plus longs coté de lappartement
    █ 10% pas soumise à la lumière


TABLE :
    █ 65% crée zone interdite(excepté pour CHAIR, SOFA, APPARTEMENT) de +(30,80cm) tous coté
    █ 30% soumise à la lumière
    
SOFA :
    █ 65% crée zone interdite(excepté pour COFFEE_TABLE, SOFA, CHAIR) de +(30,80cm) face avant
    █ 10% soumis à la chaleur
    █ if (distance SOFA et APPARTMENT <150cm)
        SOFA jamais face au coté de l appartement a proximité
    █ if (SOFA = 1)        
        70% SOFA est collé au mur
          if(true) 100% face avant soit orienté vers le centre de la pièce  
        30 % soumit à la lumière 
          if(false) générée en 3eme  
    █ if (SOFA => 2)
        70% distance entre SOFA.a et SOFA.b = SOFA.a face avant/2
          if(true) 50% SOFA.b face avant soit orienté vers SOFA.a
               else SOFA.b position = SOFA.a position + SOFA.b face avant/2 en face de SOFA.a   
      else générée en 3eme  

COFFEE_TABLE :
    █ if (SOFA => 1) 
         40% que la distance entre SOFA et COFFEE_TABLE ne soit pas plus grande que la face avant de la COFFEE_TABLE
      else générée en dernier
    █ if (SOFA => 2)    
        20 % que la distance entre 1 des COFFEE_TABLES et DOOR soit (0,200)cm
          if(true) 90% cette COFFEE_TABLE est collée au mur
        60 % que la distance entre COFFEE_TABLES et les deux premiers SOFA +(40,230)cm
          if(true) 80 % COFFEE_TABLES positionné en face de SOFA.a
      else générée en 4eme
      
CHAIR :
    █ if (face avant de la TABLE >65% plus longs que coté de la TABLE)
        position CHAIR deux par deux, face avant/face arrière de la TABLE
    █ if (TABLE => 1 )
        if (CHAIR => 2)
          75% CHAIR autour de cette TABLE, distance = (0,30)cm
          CHAIR toujours face à la (de cette) TABLE
        if (CHAIR => 4)
          85% CHAIR autour de cette TABLE, distance =  (0,20)cm
          CHAIR toujours face à la (de cette) TABLE
      else générée en 5eme
    █ if (TABLE => 2 )
        if (CHAIR => 4)
          95% CHAIR autour d une des TABLE, distance = (0,20)cm
          80% placement CHAIR soit splité en % de table
          CHAIR toujours face à la (de cette) TABLE
      else générée en 5eme


/// OLD
// vu que j'ai orienté tout les models dans le même sens


    █  for(DOOR,SLIDING_WINDOW,WINDOW,RADIATOR){
          if (Side X> Side Y) Side X = pivFrontFace
            if (Side Y> Side X ) Side Y = pivFrontFace
              else pivSideFace }

// DOOR Point spécifique 
    █  NO_OBJ(); 
        dimension(DOOR.pivFrontFace , DOOR.pivFrontFace)

// SLIDING_WINDOW Point spécifique 
    █  NO_OBJ(); 
        dimension((SLIDING_WINDOW.pivFrontFace , SLIDING_WINDOW.pivFrontFace/3) AND forcement >30cm)) // x = frontFace porte fenetre, y = frontFace porte fenetre/3 et dans tout les cas + de 30cm
    █  LIGHT_CONE(); 
        radius(SLIDING_WINDOW.pivFrontFace*2)
    
// WINDOW Point spécifique 
    █  NO_OBJ(); 
        dimension(sameAs WINDOW (x,y,z))
    █  LIGHT_CONE(); 
        radius(SLIDING_DOOR.pivFrontFace*2)
    
// RADIATOR Point spécifique 
    █  NO_OBJ(); 
        dimension(sameAs RADIATOR (x,y))
    █  HEAT_CONE(); 
        radius(RADIATOR.pivFrontFace*1.5)
    
// GENERIC_MASS Point spécifique 
    █  NO_OBJ(); 
        dimension(sameAs GENERIC_MASS(x,y,z))
     
// ************************TYPE MOBILIER*****************************************  

    █  for(CHAIR,SHELF,COFFEE_TABLE,TABLE,SOFA){
          if (Side X> Side Y ) Side X = frontFace
             if (Side Y> Side X ) Side Y = frontFace
                else sideFace }

// SHELF type
    █  (90%) pos = stuck at WALL  
              else 
                pos = (APPARTMENT.center+(random(-100,+100)))
                sideFace alwaysToward APPARTMENT.longestSide // position au cnetre de l'appart avec un random, et alligné sur la longueur de l'appartement
    █  (10%) pos = notUnder LIGHT_CONE();
    █  (20%) IN_USE(SHELF, APPARTMENT); 
               dimension(SHELF.frontFace+60cm , SHELF.SideFace)
// TABLE type
    █  (65%) IN_USE(except CHAIR, SOFA, APPARTMENT); 
               dimension(TABLE.sideX+60cm , TABLE.sideY+60cm)
    █  (30%) pos = under LIGHT_CONE();
  
// CHAIR type
    █  if(TABLE.frontFace =>65% TABLE.sideFace) 
        pos = 2*2 TABLE.frontFace alwaysToward (this)TABLE // si le coté d'une table est vraiment supérieur à l'autre, alros chaise 2 par deux de chaquaun des deux plus grands coté.
    █  if (TABLE =>1) 
          if ( => 2 CHAIR)
            (60%) pos = CHAIR DISTANCE(20) from TABLE 
            CHAIR.frontFace alwaysToward TABLE
            if (=> 4 CHAIR)
              (50%) pos = CHAIR DISTANCE(20) from TABLE 
                      CHAIR.frontFace alwaysToward TABLE
              (20%) pos = last.random();   
        else pos = last.random();        
//    █  if (TABLE =>2)
//          if ( => 2 CHAIR)
//            (60%) pos = EACH CHAIR DISTANCE(20) from EACH TABLE 
//                frontFace alwaysToward (this)TABLE
//           CHAIR.frontFace alwaysToward TABLE

// COFFEE_TABLE type
    █    if(SOFA => 1) 
           (40%) pos = COFFEE_TABLE DISTANCE(SOFA.frontFace) from SOFA
            else pos = random("inLast")
    █    if(COFFEE_TABLE => 2) 
            (20%) pos = DISTANCE(200) from DOOR
                80% pos = stuck at WALL  
// SOFA type 
    █  (80%) IN_USE (except COFFEE_TABLE, SOFA, CHAIR); 
            dimension(SOFA.frontFace, +40cm)
    █  (10%) pos = under HEAT_CONE();
    █  if (SOFA DISTANCE(<150cm) from APPARTMENT
         frontFace NeverToward APPARTMENT
    █  if (SOFA = 1) 
        (70%) pos = stuck at WALL
            frontFace alwaysToward APPARTMENT.center
        (30%) pos = under LIGHT_CONE();   
        else pos = last.random();     
    █  if (SOFA =>2)
         (75%) pos = SOFA.a DISTANCE(50,SOFA.a.frontFace/2) from SOFA.b // distance entre les deux sofa est la largeur du sofa a/2
             (50%) SOFA.b toward SOFA.a 
                  SOFA.b.pos = SOFA.a.frontSide + SOFA.b.frontSide/2 // on part de SOFA.a puis on rajoute la moitié de la taille de SOFA.b pour le positionner. Il est automatiquement tourné.
                     if(COFFEE_TABLE = 1) 
                         COFFEE_TABLE pos = "between ?"
             (50%) SOFA.b toward SOFA.a & 
         (30%) SOFA.b.frontSide 
        else pos = like SOFA=1 // utiliser comme si c'était un seul sofa
        
        
        
        
        
        
        
        
