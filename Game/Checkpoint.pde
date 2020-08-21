public class Checkpoint extends GameObject {

  Checkpoint(double x, double y, int width, int height) {
    super(x, y, width, height);
    type = "Checkpoint";
    isAffectedByGravity = false;
    objColor=color(0,100,255);
  }

  void update() {
    x += velocity.x;
    y += velocity.y;
  }

  void collidedWith(GameObject other) {
  }
}