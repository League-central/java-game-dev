public class Checkpoint extends GameObject {

  Checkpoint(double x, double y, int width, int height) {
    super(x, y, width, height);
    type = "Checkpoint";
    isAffectedByGravity = false;
  }

  void update() {
    x += velocity.x;
    y += velocity.y;
  }

  void collidedWith(GameObject other) {
  }
}
