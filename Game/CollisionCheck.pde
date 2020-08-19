public class CollisionCheck extends GameObject {

  CollisionCheck(double x, double y, int width, int height,String type) {
    super(x, y, width, height);
    this.type = type;
  }
  void update() {
  }

  void collidedWith(GameObject other) {
  }
}
