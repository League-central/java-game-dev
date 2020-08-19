public class Enemy extends GameObject {

  Enemy(double x, double y, int width, int height) {
    super(x, y, width, height);
    type = "Enemy";
  }

  void update() {
    if(frameCount % 40 == 0){
      Projectile o = new Projectile(x, y, 40, 30,new Vector(0,2));
      world.projectiles.add(o);
      
    }
  }

  void collidedWith(GameObject other) {
    if (other.type.equals("Projectile")) {
      isActive = false;
    }
  }
}
