public class Button extends Obstacle {
  boolean isPressed = false;
  GameObject createdObject;
  int activeDuration;
  int timeActivated;
  Button(double x, double y, int width, int height, GameObject createdObject, int activeDuration) {
    super(x, y, width, height);
    type = "Button";
    isAffectedByGravity = false;
    objColor = color(#FFAA00);
    this.createdObject = createdObject;
    this.activeDuration = activeDuration;
  }

  void buttonPressed() {
    world.addObstacle(createdObject);
    objColor = color(0, 0, 255);
    timeActivated = millis();
    isPressed = true;
  }

  void update() {
    if (isPressed) {
      if ((millis() / 100) % 2 == 0) {
        objColor = color(0, 0, 255);
      } else {
        objColor = color(#15216C);
      }
    }
    if (millis() > timeActivated + activeDuration && isPressed) {
      isPressed = false;
      objColor = color(#FFAA00);
      world.removeObstacle(createdObject);
    }
    x += velocity.x;
    y += velocity.y;
  }

  void collidedWith(GameObject other) {
    if (other.type.equalsIgnoreCase("player") && !isPressed) {
      if (other.y <= y  + height / 2) {
        buttonPressed();
      }
    }
  }
}
