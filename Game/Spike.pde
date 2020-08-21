public class Spike extends GameObject {

  Spike(double x, double y, int width, int height) {
    super(x, y, width, height);
    type = "Spike";
    isAffectedByGravity = false;
  }

  void update() {
    x += velocity.x;
    y += velocity.y;
  }

  void collidedWith(GameObject other) {
  }
}
