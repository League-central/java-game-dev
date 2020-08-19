public class Button extends GameObject {
boolean isPressed = false;
  Button(double x, double y, int width, int height) {
    super(x, y, width, height);
    type = "Button";
    isAffectedByGravity = false;
    objColor = color(#FFAA00);
  }

  void update() {
    x += velocity.x;
    y += velocity.y;
  }

  void collidedWith(GameObject other) {
    if(other.type.equalsIgnoreCase("player")){
    objColor = color(0,0,255);
    }
  }
}
