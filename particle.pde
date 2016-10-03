
// 20150521 am 11:18 

class particletest
{
  /*
  I named class name to same name with tab name . 
  error : 
  " the nested type particle cannot hide enclosing type "
  */
  
  PVector location;
  PVector velocity;
  PVector acceleration;
  float lifespan;
  
  particletest(PVector l)
  {
    location = l.get();
    velocity = new PVector(0 , 0);
    acceleration = new PVector(0 , 0);
    lifespan = 255.0; 
  }
    
  void run(PVector force)
  {
    update(force);
    display();
  }
  
  void applyforce(PVector force)
  {
    acceleration.add(force);
  }
  
  
  boolean isdead()
  {
    if(lifespan <= 0.0)
    {
      return true;
    }
    else
    {
      return false;
    }
  }
  
  void update(PVector force)
  {
    applyforce(force);
    velocity.add(acceleration);
    location.add(velocity);
    acceleration.mult(0);
    lifespan -= 2.0;
  }
  
  void display()
  {
    stroke(0 , lifespan);
    fill(175 , lifespan);   
    ellipse(location.x , location.y , 8 , 8);
  }
  
}
