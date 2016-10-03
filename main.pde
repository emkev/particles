
// 20150521 am 11:43

import java.util.Iterator;

ArrayList<particletest> particles;
PVector wind;
int total = 10;

void setup()
{
  size(640 , 360);
   
  particles = new ArrayList<particletest>();
  // particles of fixed size
  /*
  for(int i = 0; i < total; i++)
  {
    particles.add(new particletest(new PVector(random(1 , 200) 
    , random(10 , 200))));
  }
  */
  wind = new PVector(0.04 , 0.02);
}

void draw()
{
  background(200);
  // particles of fixed size 
  /*
  for(int i = 0; i < particles.size(); i++)
  {
    particletest p = particles.get(i);
    p.run(wind);
  }
  */
  
  // add particle dynamically
  particles.add(new particletest(new PVector(random(1 , 200) , 
  random(1 , 200)))); 
  /*
  for(int a = 0; a < particles.size(); a++)
  {
    particletest p = particles.get(a);
    p.run(wind);
    if(p.isdead())
    {
      particles.remove(a);
    }
  }
  */
  // iterator implement a loop 
  Iterator<particletest> it = particles.iterator();
  while(it.hasNext())
  {
    particletest p = it.next();
    p.run(wind);
    if(p.isdead())
    {
      it.remove();
    }
  }
  
}
