
/* 20150521 am 11:43
   2017.01.17 am 09:58 , modify
*/

import java.util.Iterator;

ArrayList<Particle> particles;
PVector wind;
int total = 10;

void setup()
{
  size(640 , 360);
   
  particles = new ArrayList<Particle>();

  wind = new PVector(0.04 , 0.02);

}

void draw()
{
  background(200);
  
  // add particle dynamically
  particles.add( new Particle( 
                               new PVector( random(1 , 200) , 
                                            random(1 , 200)   )
                              )
                ); 

  // iterator implement a loop 
  Iterator<Particle> it = particles.iterator();
  while(it.hasNext())
  {
    Particle p = it.next();
    p.run( wind );
    
    if(p.isdead())
    {
      it.remove();
    }
    
  }
  
}
