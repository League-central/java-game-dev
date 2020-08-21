public class Obstacle extends GameObject {

  Obstacle(double x, double y, int width, int height) {
    super(x, y, width, height);
    type = "Obstacle";
    isAffectedByGravity = false;
    objColor=color(16, 140, 65);
  }

  void update() {
    x += velocity.x;
    y += velocity.y;
  }

  void collidedWith(GameObject other) {
  }
}
