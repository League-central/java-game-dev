public class Enemy extends GameObject { 

  Enemy(double x, double y, int width, int height) {
    super(x, y, width, height);
    type = "Enemy";
  }

  void update() {
 if (frameCount % 38 == 0){
  world.obstacles.add( new Obstacle(x, y, 10, 10 ));
 }}

  void collidedWith(GameObject other) {
    if (other.type.equals("Projectile")) {
      isActive = false;
    }
  }
}
