public class Button extends Obstacle {

  Button(double x, double y, int width, int height) {
    super(x, y, width, height);
    type = "Button";
    isAffectedByGravity = false;
    objColor=color(0,255,0);
  }
 

  void update() {
    x += velocity.x;
    y += velocity.y;
  }

  void collidedWith(GameObject other) {
  }
}
