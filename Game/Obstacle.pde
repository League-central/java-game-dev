public class Obstacle extends GameObject {

  Obstacle(double x, double y, int width, int height) {
    super(x, y, width, height);
    type = "Obstacle";
  }

  void update() {
  }

  void collidedWith(GameObject other) {
  }
}
