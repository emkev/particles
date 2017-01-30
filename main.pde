
/* 20150521 am 11:43
   2017.01.17 am 09:58 , modify
   2017.01.24 pm       , modify
   2017.01.25 pm 21:39 , add gravity
   2017.01.26 pm 19:00 , add Repeller
*/

import java.util.Iterator;

PVector wind ;
PVector gravity ;
PVector coForce ;
ArrayList<ParticleSystem> psSys ;
Repeller repeller ;

void setup()
{
  size(640 , 360);
  
  psSys = new ArrayList<ParticleSystem>() ;
  
  wind = new PVector(0.04 , 0.02);
  gravity = new PVector(0 , 0.05);
  coForce = PVector.add( wind , gravity );
  
  repeller = new Repeller( width/2 , height/2 ) ;
  
}

void draw()
{
  background(200);

  repeller.display() ;
  
  for( ParticleSystem ps : psSys ) {
    ps.applyForce( coForce ) ;
    ps.applyRepel( repeller ) ;
    ps.run() ;
    ps.addParticle() ;
  }  
  
}

void mousePressed() {  
  psSys.add( new ParticleSystem( mouseX , mouseY ) ) ;
}

