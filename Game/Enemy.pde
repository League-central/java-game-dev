public class Enemy extends GameObject {

  Enemy(double x, double y, int width, int height) {
    super(x, y, width, height);
    type = "Enemy";
    setImage("b.png");
    
   
  }
  void update() {
      if (frameCount%30==0){
        world.projectiles.add(new Projectile(x,y,40,20,new Vector(5,0)));
         
        
        
        
        
  }
  }

  void collidedWith(GameObject other) {
    if (other.type.equals("Projectile")) {
      isActive = false;
    }
  }
}
