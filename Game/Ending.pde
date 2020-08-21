public class Ending extends Obstacle {

  Ending(double x, double y, int width, int height) {
    super(x, y, width, height);
    type = "Ending";
    isAffectedByGravity = false;
    objColor=color(0,100,100);
  }

  void update() {
    x += velocity.x;
    y += velocity.y;
  }

  void collidedWith(GameObject other) {
  }
}
