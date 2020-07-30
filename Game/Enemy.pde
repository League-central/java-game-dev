public class Enemy extends GameObject {
int health = 50;
  Enemy(double x, double y, int width, int height) {
    super(x, y, width, height);
    type = "Enemy";

 
 }

  void update() 
  {
    if(health < 0){
    isActive = false;
    }
  }

  void collidedWith(GameObject other) {
    if (other.type.equals("Projectile")) {
      health -- ;
  other.isActive = false;
  }
  }
}
