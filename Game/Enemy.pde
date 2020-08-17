public class Enemy extends GameObject {

  Enemy(double x, double y, int width, int height) {
    super(x, y, width, height);
    type = "Enemy";
  }

  void update() {
    if(frameCount % 60 == 0){
      Obstacle o = new Obstacle(x, y, 40, 30);
      world.obstacles.add(o);
      o.setVelocity(0,2);
    }
  }

  void collidedWith(GameObject other) {
    if (other.type.equals("Projectile")) {
      isActive = false;
    }
  }
}
