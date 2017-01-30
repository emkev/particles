
/*  2017.01.26 pm 19:15  */

class Repeller {
 
  PVector location ;
  int size ;
  float strength = 300 ;
  
  Repeller( float lx , float ly ) {
    location = new PVector( lx ,ly ) ;
    size = 32 ;
  }
 
  PVector repel( Particle p ) {
    
    PVector dir = PVector.sub( location , p.location ) ;
    float dist = dir.mag() ;
    dist = constrain( dist , 5 , 100 ) ;
    dir.normalize() ;
    
    float temp = (-1) * strength / ( dist * dist ) ;
    dir.mult( temp ) ;
    
    return dir ;
  }
 
  void display() {
    fill(100);
    ellipse( location.x , location.y , size , size ) ;
  }
  
}
