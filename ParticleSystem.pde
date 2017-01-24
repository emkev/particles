
/*  2017.01.24 pm 12:23  */

class ParticleSystem {

  ArrayList<Particle> particles ;
  float psLocX ;
  float psLocY ;
  
  ParticleSystem( float lx , float ly ) {
    
    particles = new ArrayList<Particle>() ;
    psLocX = lx ;
    psLocY = ly ;
  }
  
  void addParticle() {
    particles.add( new Particle( random( psLocX-30 , psLocX+30 ) , 
                                 random( psLocY-30 , psLocY+30 )   ) 
                 );
  }
  
  void run( PVector force ) {
    
    Iterator<Particle> it = particles.iterator() ;
    
    while( it.hasNext() ) {
      Particle p = it.next() ;      
      p.run( force ) ;
      if( p.isDead() ) {
        it.remove() ;
      }

    }
    
  }
  
}
