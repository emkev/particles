
/* 20150521 am 11:43
   2017.01.17 am 09:58 , modify
   2017.01.24 pm       , modify
*/

import java.util.Iterator;

PVector wind ;
ArrayList<ParticleSystem> psSys ;


void setup()
{
  size(640 , 360);
  
  psSys = new ArrayList<ParticleSystem>() ;
  
  wind = new PVector(0.04 , 0.02);

}

void draw()
{
  background(200);
  
  for( ParticleSystem ps : psSys ) {    
    ps.run( wind ) ;
    ps.addParticle() ;
  }  
  
}

void mousePressed() {  
  psSys.add( new ParticleSystem( mouseX , mouseY ) ) ;
}

