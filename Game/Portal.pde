public class Portal extends GameObject {

  Portal(double x, double y, int width, int height) {
    super(x, y, width, height);
    type = "Portal";
    isAffectedByGravity = false;
    objColor=color (65, 0, 250);
  }

  void update() {
    x += velocity.x;
    y += velocity.y;
  }

  void collidedWith(GameObject other) {
  }
}
