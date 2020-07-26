public class Player extends GameObject {
  Player(double x, double y, int width, int height) {
    super(x, y, width, height);
    type = "Player";
  }

  void update() {
  }

  void collidedWith(GameObject other) {
  }
}
