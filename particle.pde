
/* 20150521 am 11:18
   2017.01.17 am 09:49 , modify
   2017.01.24 pm 12:25 , modify
*/

class Particle
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
  
  Particle( float lx , float ly )
  {
    location = new PVector( lx , ly ) ;
    velocity = new PVector(0 , 0);
    acceleration = new PVector(0 , 0);
    lifespan = 255.0; 
  }
    
  void run( PVector force )
  {
    applyForce( force ) ;
    update();
    checkEdge() ;
    display();
  }
  
  void applyForce( PVector force )
  {
    acceleration.add( force );
  }
  
  
  boolean isDead()
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
  
  void update()
  {
    velocity.add(acceleration);
    location.add(velocity);

    acceleration.mult(0);

    lifespan -= 2.0;
  }
  
  void checkEdge() {
    if( location.x <= 0 || location.x >= width ) {
      velocity.x = (-1) * velocity.x ;
    }
    if( location.y <= 0 || location.y >= height ) {
      velocity.y = (-1) * velocity.y ;
    }
  }
   
  void display()
  {
    stroke(0 , lifespan);
    fill(175 , lifespan);   
    ellipse(location.x , location.y , 8 , 8);
  }
  
}
