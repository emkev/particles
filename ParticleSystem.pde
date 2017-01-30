
/*  2017.01.24 pm 12:23  
    2017.01.26 pm       , add repel-force
*/

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
  
  /* It is necessary for an independent apply-force function 
     in the system of particles .
   */
  void applyForce( PVector force ) {
    for( Particle p : particles ) {
      p.applyForce( force ) ;
    }
  }
  
  /* It is necessary for an independent apply-repel function 
     in the system of particles .
   */
  void applyRepel( Repeller rp ) {
    for( Particle p : particles ) {
      PVector rpForce = rp.repel( p ) ; 
      p.applyForce( rpForce ) ;
    }
  }
  
  void run() {
    
    Iterator<Particle> it = particles.iterator() ;
    
    while( it.hasNext() ) {
      Particle p = it.next() ;      
      p.run() ;      
      if( p.isDead() ) {
        it.remove() ;
      }

    }
    
  }
  
}
