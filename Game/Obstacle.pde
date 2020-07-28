public class Obstacle extends GameObject {

  Obstacle(double x, double y, int width, int height) {
    super(x, y, width, height);
    type = "Obstacle";
    isAffectedByGravity = false;
  }

  void update() {
  
 world.obstacles.add(new Obsticle(x,y,50, 0));
 obsticle.addVelocity(-2
}

  void collidedWith(GameObject other) {
  }
}
